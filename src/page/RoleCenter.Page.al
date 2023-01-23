page 50116 "BET PLAN Role Center"
{
    Caption = 'Capacity Planning Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control5042651; "Headline RC Administrator")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Red)
            {
                Caption = 'Red';
                action("Plan Demands")
                {
                    ApplicationArea = All;
                    Caption = 'Demands';
                    RunObject = Page "BET Plan Demands";
                }
                action("Plan Plans")
                {
                    ApplicationArea = All;
                    Caption = 'Plans';
                    RunObject = Page "BET Plan Plans";
                }
            }
            group(Yellow)
            {
                Caption = 'Yellow';
                action("Plan Targets")
                {
                    ApplicationArea = All;
                    Caption = 'Targets';
                    RunObject = Page "BET Plan Targets";
                }
                action("Plan ADGs")
                {
                    ApplicationArea = All;
                    Caption = 'ADGs';
                    RunObject = Page "BET Plan ADGs";
                }
                action("Plan Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Employees';
                    RunObject = Page "BET Plan Employees";
                }
            }
            group(Blue)
            {
                Caption = 'Blue';
                action("Plan Demand-PR")
                {
                    ApplicationArea = All;
                    Caption = 'Demand-ADG';
                    RunObject = Page "BET PLAN Demand-ADG";
                }
                action("Plan Demand-Area")
                {
                    ApplicationArea = All;
                    Caption = 'Demand-Area';
                    RunObject = Page "BET Plan Demand-Area";
                }
                action("Plan Plan-Employee")
                {
                    ApplicationArea = All;
                    Caption = 'Plan-Employee';
                    RunObject = Page "BET Plan Plan-Employee";
                }
                action("Plan Plan-ADG")
                {
                    ApplicationArea = All;
                    Caption = 'Plan-ADG';
                    RunObject = Page "BET Plan Plan-ADG";
                }
            }
            group(Green)
            {
                Caption = 'Green';
                action("Plan Demand-Target")
                {
                    ApplicationArea = All;
                    Caption = 'Demand-Target';
                    RunObject = Page "BET Plan Demand-Target";
                }
                action("Plan Remaining Demand")
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Demand';
                    RunObject = Page "BET PLAN Remaining Demand";
                }
                action("Plan Remaining Capacity")
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Capacity';
                    RunObject = Page "BET PLAN Remaining Capacity";
                }
            }
        }
    }
}
