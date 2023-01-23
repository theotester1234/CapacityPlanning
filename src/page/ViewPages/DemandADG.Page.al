page 50105 "BET PLAN Demand-ADG"
{
    Caption = 'Demand-ADG';
    PageType = List;
    SourceTable = "BET PLAN ADG"; // somit ist die anzahl der erstellten zeilen gleich der der existierenden projekte
    Editable = false;
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
                    Caption = 'Project No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Project No.';
                }
                field(Col1; GetDemand(LeftMostColumn)) //dynmaische spalte als Monat übergeben damit der eintrag auch stimmt
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col2; GetDemand(LeftMostColumn + 1))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 1);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field(Col3; GetDemand(LeftMostColumn + 2))
                {
                    CaptionClass = '3,' + MonthAsCode.GetMonthAsCode(LeftMostColumn + 2);
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Grand Total"; GetTotal())
                {
                    Caption = 'Grand Total';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Grand Total for the Project in the current year.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Summary; "BET PLAN Demand-ADG FactBox")
            {
                ApplicationArea = All;
                Caption = 'Summary';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Left)
            {
                ToolTip = ' ';
                Caption = 'Scroll Left';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = PreviousRecord;
                trigger OnAction()
                begin
                    if LeftMostColumn > 1 then
                        LeftMostColumn -= 1;
                end;
            }
            action(Right)
            {
                ToolTip = ' ';
                Caption = 'Scroll Right';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = NextRecord;
                trigger OnAction()
                begin
                    if LeftMostColumn < 10 then //nur dann steht monat 12 ganz rechts, abhängig von anzahl der Felder der Page
                        LeftMostColumn += 1;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LeftMostColumn := Date2DMY(Today, 2); //current month as left most column
    end;

    var
        MonthAsCode: Codeunit "BET PLAN Month as Code";
        LeftMostColumn: Integer;

    local procedure GetDemand(Month: Integer): Decimal
    var
        Demand: Record "BET PLAN Demand";
        GivenMonthAsDate: Date;
        SumOfDemands: Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG); // filter for current project in Demand tbale, wird am bei seitenaufruf für alle Einträge durchlaufen
        GivenMonthAsDate := DMY2Date(1, Month, Date2DMY(Today, 3)); // neues Datum erstellen für gegeben Monat aus Spalte, 01.Monat.aktuelles Jahr
        Demand.SetRange(Month, GivenMonthAsDate, CalcDate('<CM>', GivenMonthAsDate)); //filter nach Monat in Demand table //calcdate <CM> gibt letzten tag des monats aus

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total; //alle demands addieren für aktuellen filter
            until Demand.Next() = 0;
        exit(SumOfDemands);//demand summe ausgeben
    end;

    local procedure GetTotal(): Decimal
    var
        Demand: Record "BET PLAN Demand";
        BeginCurrentYear: Date;
        SumOfDemands: Decimal;
    begin
        Demand.SetRange(ADG, Rec.ADG);
        BeginCurrentYear := DMY2Date(1, 1, Date2DMY(Today, 3));
        Demand.SetRange(Month, BeginCurrentYear, CalcDate('<CY>', BeginCurrentYear));

        if Demand.FindSet() then
            repeat
                SumOfDemands += Demand.Total; //alle demands addieren für aktuellen filter
            until Demand.Next() = 0;
        exit(SumOfDemands);//demand summe ausgeben
    end;
}
