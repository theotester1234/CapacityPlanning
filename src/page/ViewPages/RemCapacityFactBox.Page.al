page 50119 "BET PLAN Rem. Capacity FactBox"
{
    Caption = 'Rem. Capacity FactBox';
    PageType = CardPart;
    SourceTable = "BET PLAN Month";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Month1; GetTotal(1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month2; GetTotal(2))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(2);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month3; GetTotal(3))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(3);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month4; GetTotal(4))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(4);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month5; GetTotal(5))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(5);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month6; GetTotal(6))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(6);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month7; GetTotal(7))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(7);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month8; GetTotal(8))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(8);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month9; GetTotal(9))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(9);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month10; GetTotal(10))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(10);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month11; GetTotal(11))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(11);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Month12; GetTotal(12))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(12);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Total; GetTotalTotal())
                {
                    Caption = 'Total';
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
        }
    }

    var
        MonthAsCode: Codeunit "BET PLAN Month as Code";

    local procedure GetTotal(Month: Integer): Decimal
    var
        Plan: Record "BET PLAN Plan";
        Target: Record "BET PLAN Target";
        CurrentMonthAsDate: Date;
        TotalTarget, TotalPlan : Decimal;
    begin
        CurrentMonthAsDate := DMY2Date(1, Month, Date2DMY(Today, 3));
        Plan.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));
        Target.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));

        if Plan.FindSet() then
            repeat
                TotalPlan += Plan.Days;
            until Plan.Next() = 0;
        if Target.FindSet() then
            repeat
                TotalTarget += Target.Days;
            until Target.Next() = 0;

        exit(TotalTarget - TotalPlan);
    end;

    local procedure GetTotalTotal(): Decimal
    var
        Plan: Record "BET PLAN Plan";
        Target: Record "BET PLAN Target";
        CurrentMonthAsDate: Date;
        TotalTarget, TotalPlan : Decimal;
    begin
        CurrentMonthAsDate := DMY2Date(1, 1, Date2DMY(Today, 3));
        Plan.SetRange(Month, CurrentMonthAsDate, CalcDate('<CY>', CurrentMonthAsDate));
        Target.SetRange(Month, CurrentMonthAsDate, CalcDate('<CY>', CurrentMonthAsDate));

        if Plan.FindSet() then
            repeat
                TotalPlan += Plan.Days;
            until Plan.Next() = 0;
        if Target.FindSet() then
            repeat
                TotalTarget += Target.Days;
            until Target.Next() = 0;

        exit(TotalTarget - TotalPlan);
    end;
}
