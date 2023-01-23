page 50100 "BET PLAN Demands"
{
    Caption = 'Demands';
    PageType = List;
    SourceTable = "BET PLAN Demand";
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
                field(ADG; Rec.ADG)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ADG field.';
                }
                field("Project Manager Code"; Rec."Project Manager Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Manager Code field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field(Accounting; Rec.Accounting)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accounting field.';
                }
                field("Report"; Rec."Report")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Report field.';
                }
                field(Standard; Rec.Standard)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Standard field.';
                }
                field(Automotive; Rec.Automotive)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Automotive field.';
                }
                field(Manufacturing; Rec.Manufacturing)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Manufacturing field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field(ProServ; Rec.ProServ)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ProServ field.';
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }
}
