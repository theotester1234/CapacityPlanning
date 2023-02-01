page 50118 "BET PLAN Remaining Capacity"
{
    Caption = 'Remaining Capacity';
    PageType = List;
    SourceTable = "BET PLAN Employee";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field(Col1; GetRemainingCapacity(LeftMostColumn)) //dynmaische spalte als Monat übergeben damit der eintrag auch stimmt
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col2; GetRemainingCapacity(LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col3; GetRemainingCapacity(LeftMostColumn + 2))
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
            part(Summary; "BET PLAN Rem. Capacity FactBox")
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
        if Date2DMY(Today, 2) <= 10 then
            LeftMostColumn := Date2DMY(Today, 2)
        else
            LeftMostColumn := 10;
    end;

    var
        MonthAsCode: Codeunit "BET PLAN Month as Code";
        LeftMostColumn: Integer;

    local procedure GetRemainingCapacity(Month: Integer): Decimal
    var
        Plan: Record "BET PLAN Plan";
        Target: Record "BET PLAN Target";
        CurrentMonthAsDate: Date;
        TotalTarget, TotalPlan : Decimal;
    begin
        Plan.SetRange("Employee Code", Rec."Employee Code");
        Target.SetRange("Employee Code", Rec."Employee Code");

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

    local procedure GetTotal(): Decimal
    var
        Plan: Record "BET PLAN Plan";
        Target: Record "BET PLAN Target";
        CurrentMonthAsDate: Date;
        TotalTarget, TotalPlan : Decimal;
    begin
        Plan.SetRange("Employee Code", Rec."Employee Code");
        Target.SetRange("Employee Code", Rec."Employee Code");

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
