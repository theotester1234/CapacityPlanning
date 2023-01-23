page 50109 "BET PLAN Dem.-Area Filt. Dial."
{
    Caption = 'Demand Area Filter Dialog';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field(Accounting; ToggleAccounting)
            {
                ApplicationArea = All;
                Caption = 'Accounting';
                ToolTip = 'Specifies to show Accounting on the Demand-Area Page.';
            }
            field("Report"; ToggleReport)
            {
                ApplicationArea = All;
                Caption = 'Report';
                ToolTip = 'Specifies to show Report on the Demand-Area Page.';
            }
            field(Standard; ToggleStandard)
            {
                ApplicationArea = All;
                Caption = 'Standard';
                ToolTip = 'Specifies to show Standard on the Demand-Area Page.';
            }
            field(Automotive; ToggleAutomotive)
            {
                ApplicationArea = All;
                Caption = 'Automotive';
                ToolTip = 'Specifies to show Automotive on the Demand-Area Page.';
            }
            field(Manufacturing; ToggleManufacturing)
            {
                ApplicationArea = All;
                Caption = 'Manufacturing';
                ToolTip = 'Specifies to show Manufacturing on the Demand-Area Page.';
            }
            field(Project; ToggleProject)
            {
                ApplicationArea = All;
                Caption = 'Project';
                ToolTip = 'Specifies to show Project on the Demand-Area Page.';
            }
            field(ProServ; ToggleProServ)
            {
                ApplicationArea = All;
                Caption = 'ProServ';
                ToolTip = 'Specifies to show ProServ on the Demand-Area Page.';
            }
        }
    }
    var
        ToggleAccounting, ToggleReport, ToggleStandard, ToggleAutomotive, ToggleManufacturing, ToggleProject, ToggleProServ : Boolean;

    /// <summary>
    /// Sets the value of the Toggle-Fields on the Page "Dem. Area Filt. Dial.".
    /// </summary>
    /// <param name="IsVisibleAccounting">Current visibility of Accounting column : Boolean</param>
    /// <param name="IsVisibleReport">Current visibility of Report column : Boolean</param>
    /// <param name="IsVisibleStandard">Current visibility of Standard column : Boolean</param>
    /// <param name="IsVisibleAutomotive">Current visibility of Automotive column : Boolean</param>
    /// <param name="IsVisibleManufacturing">Current visibility of Manufacturing column : Boolean</param>
    /// <param name="IsVisibleProject">Current visibility of Project column : Boolean</param>
    /// <param name="IsVisibleProServ">Current visibility of ProServ column : Boolean</param>
    procedure SetVisibility(IsVisibleAccounting: Boolean; IsVisibleReport: Boolean; IsVisibleStandard: Boolean; IsVisibleAutomotive: Boolean; IsVisibleManufacturing: Boolean; IsVisibleProject: Boolean; IsVisibleProServ: Boolean)
    begin
        ToggleAccounting := IsVisibleAccounting;
        ToggleReport := IsVisibleReport;
        ToggleStandard := IsVisibleStandard;
        ToggleAutomotive := IsVisibleAutomotive;
        ToggleManufacturing := IsVisibleManufacturing;
        ToggleProject := IsVisibleProject;
        ToggleProServ := IsVisibleProServ;
    end;

    /// <summary>
    /// Gets the values from the fields on Filter Page "Dem. Area Filt. Dial." and assign them to given parameters..
    /// </summary>
    /// <param name="IsVisibleAccounting">Visibility of Accounting column : Boolean</param>
    /// <param name="IsVisibleReport">Visibility of Report column : Boolean</param>
    /// <param name="IsVisibleStandard">Visibility of Standard column : Boolean</param>
    /// <param name="IsVisibleAutomotive">Visibility of Automotive column : Boolean</param>
    /// <param name="IsVisibleManufacturing">Visibility of Manufacturing column : Boolean</param>
    /// <param name="IsVisibleProject">Visibility of Project column : Boolean</param>
    /// <param name="IsVisibleProServ">Visibility of ProServ column : Boolean</param>
    procedure GetVisibility(var IsVisibleAccounting: Boolean; var IsVisibleReport: Boolean; var IsVisibleStandard: Boolean; var IsVisibleAutomotive: Boolean; var IsVisibleManufacturing: Boolean; var IsVisibleProject: Boolean; var IsVisibleProServ: Boolean)
    begin
        IsVisibleAccounting := ToggleAccounting;
        IsVisibleReport := ToggleReport;
        IsVisibleStandard := ToggleStandard;
        IsVisibleAutomotive := ToggleAutomotive;
        IsVisibleManufacturing := ToggleManufacturing;
        IsVisibleProject := ToggleProject;
        IsVisibleProServ := ToggleProServ;
    end;
}
