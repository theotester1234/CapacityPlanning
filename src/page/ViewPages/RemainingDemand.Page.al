page 50114 "BET PLAN Remaining Demand"
{
    Caption = 'Remaining Demand';
    PageType = List;
    SourceTable = "BET PLAN ADG";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ADG; Rec.ADG)
                {
                    Caption = 'ADG';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ADG field.';
                }
                field(Col1; GetRemainingDemand(LeftMostColumn)) //dynmaische spalte als Monat übergeben damit der eintrag auch stimmt
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col2; GetRemainingDemand(LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col3; GetRemainingDemand(LeftMostColumn + 2))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 2);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Total; GetTotal())
                {
                    Caption = 'Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Summary; "BET PLAN Rem. Demand FactBox")
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
                    if LeftMostColumn < 10 then //nur dann steht monat 12 ganz rechts, abhängig von anzahl der Felder der Page
                        LeftMostColumn += 1;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LeftMostColumn := Date2DMY(Today, 2); //current month as left most column
    end;

    var
        MonthAsCode: Codeunit "BET PLAN Month as Code";
        LeftMostColumn: Integer;

    local procedure GetRemainingDemand(Month: Integer): Decimal
    var
        Demand: Record "BET PLAN Demand";
        Plan: Record "BET PLAN Plan";
        CurrentMonthAsDate: Date;
        TotalDemand, TotalPlan : Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG);
        Plan.SetRange(ADG, Rec.ADG);

        CurrentMonthAsDate := DMY2Date(1, Month, Date2DMY(Today, 3));
        Demand.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));
        Plan.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));

        if Demand.FindSet() then
            repeat
                TotalDemand += Demand.Total;
            until Demand.Next() = 0;
        if Plan.FindSet() then
            repeat
                TotalPlan += Plan.Days;
            until Plan.Next() = 0;

        exit(TotalDemand - TotalPlan);
    end;

    local procedure GetTotal(): Decimal
    var
        Demand: Record "BET PLAN Demand";
        Plan: Record "BET PLAN Plan";
        CurrentYearAsDate: Date;
        TotalDemand, TotalPlan : Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG);
        Plan.SetRange(ADG, Rec.ADG);

        CurrentYearAsDate := DMY2Date(1, 1, Date2DMY(Today, 3));
        Demand.SetRange(Month, CurrentYearAsDate, CalcDate('<CY>', CurrentYearAsDate));
        Plan.SetRange(Month, CurrentYearAsDate, CalcDate('<CY>', CurrentYearAsDate));

        if Demand.FindSet() then
            repeat
                TotalDemand += Demand.Total;
            until Demand.Next() = 0;
        if Plan.FindSet() then
            repeat
                TotalPlan += Plan.Days;
            until Plan.Next() = 0;

        exit(TotalDemand - TotalPlan);
    end;
}
