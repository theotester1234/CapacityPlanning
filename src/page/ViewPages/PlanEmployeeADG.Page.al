page 50111 "BET PLAN Plan-Employee-ADG"
{
    Caption = 'Plan-Employee-ADG';
    PageType = List;
    SourceTable = "BET PLAN Plan";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

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
                field(ADG; Rec.ADG)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ADG field.';
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
