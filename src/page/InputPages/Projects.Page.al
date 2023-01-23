page 50115 "BET PLAN Projects"
{
    Caption = 'Projects';
    PageType = List;
    SourceTable = "BET PLAN Project";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
            }
        }
    }
}
