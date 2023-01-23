page 50104 "BET PLAN Employees"
{
    Caption = 'Employees';
    PageType = List;
    SourceTable = "BET PLAN Employee";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
            }
        }
    }
}
