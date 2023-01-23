page 50108 "BET PLAN Demand-Area FactBox"
{
    Caption = 'Demand Area FactBox';
    PageType = CardPart;
    SourceTable = "BET PLAN Demand";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Summary';
                field("Accounting Summary"; GetTotal(Areas::Accounting))
                {
                    Caption = 'Accounting-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Accounting-Total for all Projects.';
                }

                field("Report Summary"; GetTotal(Areas::Report))
                {
                    Caption = 'Report-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Report-Total for all Projects.';
                }
                field("Standard Summary"; GetTotal(Areas::Standard))
                {
                    Caption = 'Standard-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Standard-Total for all Projects.';
                }
                field("Automotive Summary"; GetTotal(Areas::Automotive))
                {
                    Caption = 'Automotive-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Automotive-Total for all Projects.';
                }
                field("Manufacturing Summary"; GetTotal(Areas::Manufacturing))
                {
                    Caption = 'Manufacturing-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Manufacturing-Total for all Projects.';
                }
                field("Project Summary"; GetTotal(Areas::Project))
                {
                    Caption = 'Project-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Project-Total for all Projects.';
                }
                field("ProServ Summary"; GetTotal(Areas::ProServ))
                {
                    Caption = 'ProServ-Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ProServ-Total for all Projects.';
                }
                field("Total Summary"; GetTotal(Areas::Total))
                {
                    Caption = 'Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Total for all Projects.';
                }
            }
        }
    }

    var
        Areas: Option Accounting,Report,Standard,Automotive,Manufacturing,Project,ProServ,Total;

    local procedure GetTotal("area": Option): Decimal
    var
        Demand: Record "BET PLAN Demand";
        StartDate: Date;
        EndDate: Date;
        CurrentYear: Integer;
        CurrentMonth: Integer;
        SumOfAreaDemands: Decimal;
    begin
        CurrentYear := Date2DMY(Today, 3);
        CurrentMonth := Date2DMY(Today, 2);
        StartDate := DMY2Date(1, CurrentMonth, CurrentYear);
        EndDate := DMY2Date(31, 12, CurrentYear);
        Demand.SetRange(Month, StartDate, EndDate);

        if Demand.FindSet() then
            repeat
                case "area" of
                    Areas::Accounting:
                        SumOfAreaDemands += Demand.Accounting;
                    Areas::Report:
                        SumOfAreaDemands += Demand.Report;
                    Areas::Standard:
                        SumOfAreaDemands += Demand.Standard;
                    Areas::Automotive:
                        SumOfAreaDemands += Demand.Automotive;
                    Areas::Manufacturing:
                        SumOfAreaDemands += Demand.Manufacturing;
                    Areas::Project:
                        SumOfAreaDemands += Demand.Project;
                    Areas::ProServ:
                        SumOfAreaDemands += Demand.ProServ;
                    Areas::Total:
                        SumOfAreaDemands += Demand.Total;
                end;
            until Demand.Next() = 0;
        exit(SumOfAreaDemands);
    end;
}
