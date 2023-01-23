page 50106 "BET PLAN Demand-ADG FactBox"
{
    Caption = 'Demand-ADG FactBox';
    PageType = CardPart;
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
        Demand: Record "BET PLAN Demand";
        StartCurrentMonth: Date;
        SumOfDemands: Decimal;
    begin
        StartCurrentMonth := DMY2Date(1, Month, Date2DMY(Today, 3));
        Demand.SetRange(Month, StartCurrentMonth, CalcDate('<CM>', StartCurrentMonth));

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total; //alle demands addieren für aktuellen filter
            until Demand.Next() = 0;
        exit(SumOfDemands);//demand summe ausgeben
    end;

    local procedure GetTotalTotal(): Decimal
    var
        Demand: Record "BET PLAN Demand";
        StartCurrentYear: Date;
        SumOfDemands: Decimal;
    begin
        StartCurrentYear := DMY2Date(1, 1, Date2DMY(Today, 3));
        Demand.SetRange(Month, StartCurrentYear, CalcDate('<CY>', StartCurrentYear));

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total; //alle demands addieren für aktuellen filter
            until Demand.Next() = 0;
        exit(SumOfDemands);//demand summe ausgeben
    end;
}
