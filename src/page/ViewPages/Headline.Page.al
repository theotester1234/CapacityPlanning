page 50121 "BET PLAN Headline"
{
    Caption = 'BET PLAN Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;
    SourceTable = "BET PLAN Plan";

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingText; RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Greeting headline';
                    Editable = false;
                }
            }
            group(Control2)
            {
                ShowCaption = false;
                Visible = DefaultFieldsVisible;
                field(CurrentNoOfADGsText; GetNoOfADGsText(Options::Current))
                {
                    ApplicationArea = All;
                    Caption = 'No. of ADGs current month headline';
                    DrillDown = true;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        OpenPlans(Options::Current);
                    end;
                }
                field(NextNoOfADGsText; GetNoOfADGsText(Options::Next))
                {
                    ApplicationArea = All;
                    Caption = 'No. of ADGs next month headline';
                    DrillDown = true;
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        OpenPlans(Options::Next);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Administrator");
        DefaultFieldsVisible := RCHeadlinesPageCommon.AreDefaultFieldsVisible();
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        [InDataSet]
        DefaultFieldsVisible: Boolean;
        [InDataSet]
        UserGreetingVisible: Boolean;
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";
        Filter: Codeunit "BET PLAN Filter";
        Options: Option Current,Next;

    local procedure GetNoOfADGsText(Option: Option): Text
    var
        NoOfADGs: Integer;
        MonthTxt, NoOfADGsTxt : Text;
    begin
        Filter.SetFilterUser(Rec);
        Filter.SetFilterMonth(Rec, Option);
        NoOfADGs := Rec.Count;
        case Option of
            Options::Current:
                MonthTxt := 'This month ';
            Options::Next:
                MonthTxt := 'Next month ';
        end;
        NoOfADGsTxt := MonthTxt + 'you have ' + Format(NoOfADGs) + ' projects assigned to you.';
        exit(NoOfADGsTxt);
    end;

    local procedure OpenPlans(Option: Option)
    var
        Plans: Page "BET PLAN Plans";
    begin
        Filter.SetFilterUser(Rec);
        Filter.SetFilterMonth(Rec, Option);
        Plans.SetTableView(Rec);
        Plans.Editable(false);
        Plans.RunModal();
    end;
}
