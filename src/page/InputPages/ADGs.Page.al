page 50103 "BET PLAN ADGs"
{
    Caption = 'ADGs';
    PageType = List;
    SourceTable = "BET PLAN ADG";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
