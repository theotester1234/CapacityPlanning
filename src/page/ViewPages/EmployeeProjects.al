page 50120 "BET PLAN Employee Projects"
{
    Caption = 'Employee Projects';
    PageType = CardPart;
    SourceTable = "BET PLAN Plan";

    layout
    {
        area(content)
        {
            cuegroup("This month")
            {
                Caption = 'This month';
                field(Project1; GetProjectTarget(Options::Current, 1))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Current, 1);
                    Visible = IsVisibleProjectCurrentMonth1;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Current, 1);
                    end;
                }
                field(Project2; GetProjectTarget(Options::Current, 2))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Current, 2);
                    Visible = IsVisibleProjectCurrentMonth2;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Current, 2);
                    end;
                }
                field(Project3; GetProjectTarget(Options::Current, 3))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Current, 3);
                    Visible = IsVisibleProjectCurrentMonth3;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Current, 3);
                    end;
                }
                field(Project4; GetProjectTarget(Options::Current, 4))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Current, 4);
                    Visible = IsVisibleProjectCurrentMonth4;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Current, 4);
                    end;
                }
                field(Project5; GetProjectTarget(Options::Current, 5))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Current, 5);
                    Visible = IsVisibleProjectCurrentMonth5;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Current, 5);
                    end;
                }
            }
            cuegroup("Next month")
            {
                Caption = 'Next month';
                field(ProjectNext1; GetProjectTarget(Options::Next, 1))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Next, 1);
                    Visible = IsVisibleProjectNextMonth1;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Next, 1);
                    end;
                }
                field(ProjectNext2; GetProjectTarget(Options::Next, 2))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Next, 2);
                    Visible = IsVisibleProjectNextMonth2;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Next, 2);
                    end;
                }
                field(ProjectNext3; GetProjectTarget(Options::Next, 3))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Next, 3);
                    Visible = IsVisibleProjectNextMonth3;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Next, 3);
                    end;
                }
                field(ProjectNext4; GetProjectTarget(Options::Next, 4))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Next, 4);
                    Visible = IsVisibleProjectNextMonth4;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Next, 4);
                    end;
                }
                field(ProjectNext5; GetProjectTarget(Options::Next, 5))
                {
                    ApplicationArea = All;
                    CaptionClass = '3,' + GetProject(Options::Next, 5);
                    Visible = IsVisibleProjectNextMonth5;
                    trigger OnDrillDown()
                    begin
                        OpenPlan(Options::Next, 5);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        GetVisibility();
    end;

    var
        Filter: Codeunit "BET PLAN Filter";
        Options: Option Current,Next;
        IsVisibleProjectCurrentMonth: array[5] of Boolean;
        IsVisibleProjectCurrentMonth1, IsVisibleProjectCurrentMonth2, IsVisibleProjectCurrentMonth3, IsVisibleProjectCurrentMonth4, IsVisibleProjectCurrentMonth5 : Boolean;

        IsVisibleProjectNextMonth: array[5] of Boolean;
        IsVisibleProjectNextMonth1, IsVisibleProjectNextMonth2, IsVisibleProjectNextMonth3, IsVisibleProjectNextMonth4, IsVisibleProjectNextMonth5 : Boolean;
        EmployeePlansCurrentMonth: array[10] of Text;
        EmployeePlansNextMonth: array[10] of Text;

    local procedure GetVisibility()
    var
        i, j : Integer;
    begin
        i := 1;
        j := 1;
        if ExistsPlan(Options::Current) then
            if Rec.FindSet() then
                repeat
                    IsVisibleProjectCurrentMonth[i] := true;
                    i += 1;
                until (Rec.Next() = 0) or (i > 5);
        if ExistsPlan(Options::Next) then
            if Rec.FindSet() then
                repeat
                    IsVisibleProjectNextMonth[j] := true;
                    j += 1;
                until (Rec.Next() = 0) or (j > 5);
        IsVisibleProjectCurrentMonth1 := IsVisibleProjectCurrentMonth[1];
        IsVisibleProjectCurrentMonth2 := IsVisibleProjectCurrentMonth[2];
        IsVisibleProjectCurrentMonth3 := IsVisibleProjectCurrentMonth[3];
        IsVisibleProjectCurrentMonth4 := IsVisibleProjectCurrentMonth[4];
        IsVisibleProjectCurrentMonth5 := IsVisibleProjectCurrentMonth[5];
        IsVisibleProjectNextMonth1 := IsVisibleProjectNextMonth[1];
        IsVisibleProjectNextMonth2 := IsVisibleProjectNextMonth[2];
        IsVisibleProjectNextMonth3 := IsVisibleProjectNextMonth[3];
        IsVisibleProjectNextMonth4 := IsVisibleProjectNextMonth[4];
        IsVisibleProjectNextMonth5 := IsVisibleProjectNextMonth[5];
    end;

    local procedure GetProjectTarget(Option: Option; FieldNo: Integer): Decimal
    var
        Days: Decimal;
        ADG: Code[20];
    begin
        if ExistsPlan(Option) then begin
            GetEmployeeProjects(Option);
            SetFilterADG(Option, FieldNo);
            ADG := GetProject(Option, FieldNo);
            Rec.SetRange(ADG, ADG);
            if Rec.FindFirst() then
                Days := Rec.Days;
            exit(Days);
        end;
    end;


    local procedure GetEmployeeProjects(Option: Option)
    var
        i: Integer;
    begin
        i := 1;
        if Rec.FindSet() then begin
            repeat
                case Option of
                    Options::Current:
                        begin
                            EmployeePlansCurrentMonth[i] := Rec.ADG;
                        end;
                    Options::Next:
                        begin
                            EmployeePlansNextMonth[i] := Rec.ADG;
                        end;
                end;
                i += 1;
            until (Rec.Next() = 0) or (i > 5);
        end;
    end;

    local procedure GetProject(Option: Option; FieldNo: Integer): Text
    begin
        case Option of
            Options::Current:
                exit(EmployeePlansCurrentMonth[FieldNo]);
            Options::Next:
                exit(EmployeePlansNextMonth[FieldNo]);
        end;
    end;

    local procedure ExistsPlan(Option: Option): Boolean
    begin
        Filter.SetFilterUser(Rec);
        Filter.SetFilterMonth(Rec, Option);
        if Rec.FindSet() then
            exit(true)
        else
            exit(false);
    end;



    local procedure SetFilterADG(Option: Option; FieldNo: Integer)
    begin
        case Option of
            Options::Current:
                Rec.SetRange(ADG, EmployeePlansCurrentMonth[FieldNo]);
            Options::Next:
                Rec.SetRange(ADG, EmployeePlansNextMonth[FieldNo]);
        end;
    end;

    local procedure OpenPlan(Option: Option; FieldNo: Integer)
    var
        Plans: Page "BET PLAN Plans";
    begin
        Filter.SetFilterUser(Rec);
        Filter.SetFilterMonth(Rec, Options::Current);
        SetFilterADG(Options::Current, FieldNo);
        Plans.SetTableView(Rec);
        Plans.Editable(false);
        Plans.RunModal();
    end;
}
