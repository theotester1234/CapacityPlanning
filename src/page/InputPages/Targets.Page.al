page 50102 "BET PLAN Targets"
{
    Caption = 'Targets';
    PageType = List;
    SourceTable = "BET PLAN Target";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days field.';
                }
            }
        }
    }
}
