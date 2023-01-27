page 50107 "BET PLAN Demand-Area"
{
    Caption = 'Demand-Area';
    PageType = List;
    SourceTable = "BET PLAN Month"; // somit ist die anzahl der erstellten zeilen gleich der der existierenden projekte
    Editable = false;
    PromotedActionCategories = 'New,Process,Report,Views,Create own Filter';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Month; Rec."Month")
                {
                    Caption = 'Month';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Month';
                }
                field(Accounting; GetDemand(Areas::Accounting))
                {
                    Caption = 'Accounting';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Accounting.';
                    Visible = IsVisibleAccounting;
                }
                field(Report; GetDemand(Areas::Report))
                {
                    Caption = 'Report';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Report.';
                    Visible = IsVisibleReport;
                }
                field(Standard; GetDemand(Areas::Standard))
                {
                    Caption = 'Standard';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Standard.';
                    Visible = IsVisibleStandard;
                }
                field(Automotive; GetDemand(Areas::Automotive))
                {
                    Caption = 'Automotive';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Automotive.';
                    Visible = IsVisibleAutomotive;
                }
                field(Manufacturing; GetDemand(Areas::Manufacturing))
                {
                    Caption = 'Manufacturing';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Manufacturing.';
                    Visible = IsVisibleManufacturing;
                }
                field(Project; GetDemand(Areas::Project))
                {
                    Caption = 'Project';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of Project.';
                    Visible = IsVisibleProject;
                }
                field(ProServ; GetDemand(Areas::ProServ))
                {
                    Caption = 'ProServ';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total of ProServ.';
                    Visible = IsVisibleProServ;
                }
                field("Total"; GetDemand(Areas::Total)) //TODO based on current visible columns
                {
                    Caption = 'Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total for all Projects.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Summary; "BET PLAN Demand-Area FactBox")
            {
                ApplicationArea = All;
                Caption = 'Summary';
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group("View areas")
            {
                Caption = 'View areas';

                action("Show All")
                {
                    ToolTip = 'Specifies to show all areas.';
                    Caption = 'All';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        IsVisibleAccounting := true;
                        IsVisibleReport := true;
                        IsVisibleStandard := true;
                        IsVisibleAutomotive := true;
                        IsVisibleManufacturing := true;
                        IsVisibleProject := true;
                        IsVisibleProServ := true;
                    end;
                }
                action("Show Accounting")
                {
                    ToolTip = 'Specifies to only show Accounting area.';
                    Caption = 'Accounting';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Accounting);
                    end;
                }
                action("Show Report")
                {
                    ToolTip = 'Specifies to only show Report area.';
                    Caption = 'Report';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Report);
                    end;
                }
                action("Show Standard")
                {
                    ToolTip = 'Specifies to only show Standard area.';
                    Caption = 'Standard';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Standard);
                    end;
                }
                action("Show Automotive")
                {
                    ToolTip = 'Specifies to only show Automotive area.';
                    Caption = 'Automotive';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Automotive);
                    end;
                }
                action("Show Manufacturing")
                {
                    ToolTip = 'Specifies to only show Manufacturing area.';
                    Caption = 'Manufacturing';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Manufacturing);
                    end;
                }
                action("Show Project")
                {
                    ToolTip = 'Specifies to only show Project area.';
                    Caption = 'Project';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::Project);
                    end;
                }
                action("Show ProServ")
                {
                    ToolTip = 'Specifies to only show ProServ area.';
                    Caption = 'ProServ';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        ViewFilter(Areas::ProServ);
                    end;
                }
            }
            group("Create own View")
            {
                Caption = 'Create own View';
                action("Create own Filter")
                {
                    ToolTip = 'Create an own View to show only selected fields.';
                    Caption = 'Create own View';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    Image = Filter;
                    trigger OnAction()
                    begin
                        CreateOwnView();
                    end;
                }
            }
        }
    }

    trigger OnInit()
    var
        InitMonths: Codeunit "BET PLAN Init Months";
    begin
        InitMonths.Init();
    end;

    trigger OnOpenPage()
    begin
        IsVisibleAccounting := true;
        IsVisibleReport := true;
        IsVisibleStandard := true;
        IsVisibleAutomotive := true;
        IsVisibleManufacturing := true;
        IsVisibleProject := true;
        IsVisibleProServ := true;
    end;

    var
        Areas: Option Accounting,Report,Standard,Automotive,Manufacturing,Project,ProServ,Total;
        IsVisibleAccounting: Boolean;
        IsVisibleReport: Boolean;
        IsVisibleStandard: Boolean;
        IsVisibleAutomotive: Boolean;
        IsVisibleManufacturing: Boolean;
        IsVisibleProject: Boolean;
        IsVisibleProServ: Boolean;

    local procedure ViewFilter("area": Option)
    begin
        IsVisibleAccounting := false;
        IsVisibleReport := false;
        IsVisibleStandard := false;
        IsVisibleAutomotive := false;
        IsVisibleManufacturing := false;
        IsVisibleProject := false;
        IsVisibleProServ := false;

        case "area" of
            Areas::Accounting:
                IsVisibleAccounting := true;
            Areas::Report:
                IsVisibleReport := true;
            Areas::Standard:
                IsVisibleStandard := true;
            Areas::Automotive:
                IsVisibleAutomotive := true;
            Areas::Manufacturing:
                IsVisibleManufacturing := true;
            Areas::Project:
                IsVisibleProject := true;
            Areas::ProServ:
                IsVisibleProServ := true;
        end;
    end;

    local procedure CreateOwnView()
    var
        DemAreaFiltDial: Page "BET PLAN Dem.-Area Filt. Dial.";
    begin
        DemAreaFiltDial.SetVisibility(IsVisibleAccounting, IsVisibleReport, IsVisibleStandard, IsVisibleAutomotive, IsVisibleManufacturing, IsVisibleProject, IsVisibleProServ);

        if DemAreaFiltDial.RunModal() = Action::OK then
            DemAreaFiltDial.GetVisibility(IsVisibleAccounting, IsVisibleReport, IsVisibleStandard, IsVisibleAutomotive, IsVisibleManufacturing, IsVisibleProject, IsVisibleProServ);
    end;


    local procedure GetDemand("area": Option): Decimal
    var
        Demand: Record "BET PLAN Demand";
        StartCurrentMonth: Date;
        CurrentMonth: Integer;
        SumOfDemands: Decimal;
    begin
        if CopyStr(Rec.Month, 1, 1) = '0' then
            Evaluate(CurrentMonth, (CopyStr(Rec.Month, 4, 1)))
        else
            Evaluate(CurrentMonth, (CopyStr(Rec.Month, 4, 2)));
        StartCurrentMonth := DMY2Date(1, CurrentMonth, Date2DMY(Today, 3)); // neues Datum erstellen für gegeben Monat aus Spalte, 01.Monat.aktuelles Jahr
        Demand.SetRange(Month, StartCurrentMonth, CalcDate('<CM>', StartCurrentMonth)); //filter nach Monat in Demand table //calcdate <CM> gibt letzten tag des monats aus 

        if Demand.FindSet() then
            repeat
                case "area" of
                    Areas::Accounting:
                        SumOfDemands += Demand.Accounting;
                    Areas::Report:
                        SumOfDemands += Demand.Report;
                    Areas::Standard:
                        SumOfDemands += Demand.Standard;
                    Areas::Automotive:
                        SumOfDemands += Demand.Automotive;
                    Areas::Manufacturing:
                        SumOfDemands += Demand.Manufacturing;
                    Areas::Project:
                        SumOfDemands += Demand.Project;
                    Areas::ProServ:
                        SumOfDemands += Demand.ProServ;
                    Areas::Total:
                        SumOfDemands += GetTotal(Demand);
                end;
            until Demand.Next() = 0;
        exit(SumOfDemands);
    end;

    local procedure GetTotal(Demand: Record "BET PLAN Demand") SumOfDemands: Decimal
    begin
        if IsVisibleAccounting then
            SumOfDemands += Demand.Accounting;
        if IsVisibleReport then
            SumOfDemands += Demand.Report;
        if IsVisibleStandard then
            SumOfDemands += Demand.Standard;
        if IsVisibleAutomotive then
            SumOfDemands += Demand.Automotive;
        if IsVisibleManufacturing then
            SumOfDemands += Demand.Manufacturing;
        if IsVisibleProject then
            SumOfDemands += Demand.Project;
        if IsVisibleProServ then
            SumOfDemands += Demand.ProServ;
        exit(SumOfDemands)
    end;

}