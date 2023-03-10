page 50105 "BET PLAN Demand-ADG"
{
    Caption = 'Demand-ADG';
    PageType = List;
    SourceTable = "BET PLAN ADG";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ADG; Rec.ADG)
                {
                    Caption = 'Project No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Project No.';
                }
                field(Col1; GetDemand(LeftMostColumn))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col2; GetDemand(LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col3; GetDemand(LeftMostColumn + 2))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 2);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Grand Total"; GetTotal())
                {
                    Caption = 'Grand Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Grand Total for the Project in the current year.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Summary; "BET PLAN Demand-ADG FactBox")
            {
                ApplicationArea = All;
                Caption = 'Summary';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Left)
            {
                ToolTip = ' ';
                Caption = 'Scroll Left';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = PreviousRecord;
                trigger OnAction()
                begin
                    if LeftMostColumn > 1 then
                        LeftMostColumn -= 1;
                end;
            }
            action(Right)
            {
                ToolTip = ' ';
                Caption = 'Scroll Right';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = NextRecord;
                trigger OnAction()
                begin
                    if LeftMostColumn < 10 then
                        LeftMostColumn += 1;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Date2DMY(Today, 2) <= 10 then
            LeftMostColumn := Date2DMY(Today, 2)
        else
            LeftMostColumn := 10;
    end;

    var
        MonthAsCode: Codeunit "BET PLAN Month as Code";
        LeftMostColumn: Integer;

    local procedure GetDemand(Month: Integer): Decimal
    var
        Demand: Record "BET PLAN Demand";
        GivenMonthAsDate: Date;
        SumOfDemands: Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG);
        GivenMonthAsDate := DMY2Date(1, Month, Date2DMY(Today, 3));
        Demand.SetRange(Month, GivenMonthAsDate, CalcDate('<CM>', GivenMonthAsDate));

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total;
            until Demand.Next() = 0;
        exit(SumOfDemands);
    end;

    local procedure GetTotal(): Decimal
    var
        Demand: Record "BET PLAN Demand";
        BeginCurrentYear: Date;
        SumOfDemands: Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG);
        BeginCurrentYear := DMY2Date(1, 1, Date2DMY(Today, 3));
        Demand.SetRange(Month, BeginCurrentYear, CalcDate('<CY>', BeginCurrentYear));

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total;
            until Demand.Next() = 0;
        exit(SumOfDemands);
    end;
}
