page 50112 "BET PLAN Plan-ADG"
{
    Caption = 'Plan-ADG';
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ADG field.';
                }

                field(Col1; GetDays(LeftMostColumn))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn);
                    ApplicationArea = All;
                    ToolTip = ' ';
                    trigger OnDrillDown()
                    var
                        Plan: Record "BET PLAN Plan";
                        PlanEmployeeADG: Page "BET PLAN Plan-Employee-ADG";
                        CurrentMonth: Date;
                    begin
                        PlanEmployeeADG.Editable(false);
                        PlanEmployeeADG.GetRecord(Plan);
                        Plan.SetRange(ADG, Rec.ADG);
                        CurrentMonth := DMY2Date(1, LeftMostColumn, Date2DMY(Today, 3));
                        Plan.SetRange(Month, CurrentMonth, CalcDate('<CM>', CurrentMonth));
                        PlanEmployeeADG.SetTableView(Plan);
                        PlanEmployeeADG.RunModal();
                    end;
                }
                field(Col2; GetDays(LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                    trigger OnDrillDown()
                    var
                        Plan: Record "BET PLAN Plan";
                        PlanEmployeeADG: Page "BET PLAN Plan-Employee-ADG";
                        CurrentMonth: Date;
                    begin
                        PlanEmployeeADG.Editable(false);
                        PlanEmployeeADG.GetRecord(Plan);
                        Plan.SetRange(ADG, Rec.ADG);
                        CurrentMonth := DMY2Date(1, LeftMostColumn + 1, Date2DMY(Today, 3));
                        Plan.SetRange(Month, CurrentMonth, CalcDate('<CM>', CurrentMonth));
                        PlanEmployeeADG.SetTableView(Plan);
                        PlanEmployeeADG.RunModal();
                    end;
                }
                field(Col3; GetDays(LeftMostColumn + 2))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 2);
                    ApplicationArea = All;
                    ToolTip = ' ';
                    trigger OnDrillDown()
                    var
                        Plan: Record "BET PLAN Plan";
                        PlanEmployeeADG: Page "BET PLAN Plan-Employee-ADG";
                        CurrentMonth: Date;
                    begin
                        PlanEmployeeADG.Editable(false);
                        PlanEmployeeADG.GetRecord(Plan);
                        Plan.SetRange(ADG, Rec.ADG);
                        CurrentMonth := DMY2Date(1, LeftMostColumn + 2, Date2DMY(Today, 3));
                        Plan.SetRange(Month, CurrentMonth, CalcDate('<CM>', CurrentMonth));
                        PlanEmployeeADG.SetTableView(Plan);
                        PlanEmployeeADG.RunModal();
                    end;
                }
                field("Grand Total"; GetTotal())
                {
                    Caption = 'Grand Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Grand Total for the Project in the current year.';
                }
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

    local procedure GetDays(Month: Integer): Decimal
    var
        Plan: Record "BET PLAN Plan";
        GivenMonthAsDate: Date;
        SumOfDemands: Decimal;
    begin
        Plan.SetRange(ADG, Rec.ADG);
        GivenMonthAsDate := DMY2Date(1, Month, Date2DMY(Today, 3));
        Plan.SetRange(Month, GivenMonthAsDate, CalcDate('<CM>', GivenMonthAsDate));

        if Plan.FindSet() then
            repeat
                SumOfDemands += Plan.Days;
            until Plan.Next() = 0;
        exit(SumOfDemands);
    end;

    local procedure GetTotal(): Decimal
    var
        Plan: Record "BET PLAN Plan";
        BeginCurrentYear: Date;
        SumOfDemands: Decimal;
    begin
        Plan.SetRange(ADG, Rec.ADG);
        BeginCurrentYear := DMY2Date(1, 1, Date2DMY(Today, 3));
        Plan.SetRange(Month, BeginCurrentYear, CalcDate('<CY>', BeginCurrentYear));

        if Plan.FindSet() then
            repeat
                SumOfDemands += Plan.Days;
            until Plan.Next() = 0;
        exit(SumOfDemands);
    end;
}