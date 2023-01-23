page 50113 "BET PLAN Demand-Target"
{
    Caption = 'Demand-Target';
    PageType = List;
    SourceTable = "BET PLAN Month";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Month; Rec.Month)
                {
                    Caption = 'Month';
                    ToolTip = 'Specifies the value of the Month field.';
                    ApplicationArea = All;
                }
                field("Total Demand"; GetTotal(Options::Demand))
                {
                    Caption = 'Total Demand';
                    ToolTip = 'Specifies the value of the Total Demand field.';
                    ApplicationArea = All;
                }
                field("Total Target"; GetTotal(Options::Target))
                {
                    Caption = 'Total Target';
                    ToolTip = 'Specifies the value of the Total Target field.';
                    ApplicationArea = All;
                }
                field("Remaining Capacity"; GetTotal(Options::Remaining))
                {
                    Caption = 'Remaining Capacity';
                    ToolTip = 'Specifies the value of the Remaining Capacity field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        Options: Option Demand,Target,Remaining;

    local procedure GetTotal(Option: Option): Decimal
    var
        Demand: Record "BET PLAN Demand";
        Target: Record "BET PLAN Target";
        CurrentMonthAsDate: Date;
        CurrentMonth: Integer;
        TotalDemand, TotalTarget : Decimal;
    begin
        if CopyStr(Rec.Month, 1, 1) = '0' then
            Evaluate(CurrentMonth, (CopyStr(Rec.Month, 2, 1)))
        else
            Evaluate(CurrentMonth, (CopyStr(Rec.Month, 1, 2)));
        CurrentMonthAsDate := DMY2Date(1, CurrentMonth, Date2DMY(Today, 3));
        Demand.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));
        if Demand.FindSet() then
            repeat
                TotalDemand += Demand.Total;
            until Demand.Next() = 0;
        Target.SetRange(Month, CurrentMonthAsDate, CalcDate('<CM>', CurrentMonthAsDate));
        if Target.FindSet() then
            repeat
                TotalTarget += Target.Days;
            until Target.Next() = 0;

        case Option of
            Options::Demand:
                exit(TotalDemand);
            Options::Target:
                exit(TotalTarget);
            Options::Remaining:
                exit(TotalTarget - TotalDemand);
        end;
    end;
}
