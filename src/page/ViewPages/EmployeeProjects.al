page 50120 "BET PLAN Employee Projects"
{
    Caption = ' Employee Projects';
    PageType = CardPart;
    SourceTable = "BET PLAN Plan";

    layout
    {
        area(content)
        {
            cuegroup("This month")
            {
                Caption = 'This month';
                field(Project1; GetProjectTarget(1))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(1, false);
                    Visible = IsVisibleProjectCurrentMonth1;
                }
                field(Project2; GetProjectTarget(2)) //TODO wird ausgaführ unabhängig von field davor, heißt abfrage machen auf record 
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(2, false);
                    Visible = IsVisibleProjectCurrentMonth2;
                }
                field(Project3; GetProjectTarget(3))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(3, false);
                    Visible = IsVisibleProjectCurrentMonth3;
                }
                field(Project4; GetProjectTarget(4))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(4, false);
                    Visible = IsVisibleProjectCurrentMonth4;
                }
                field(Project5; GetProjectTarget(5))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(5, false);
                    Visible = IsVisibleProjectCurrentMonth5;
                }
            }
            cuegroup("Next month")
            {
                Caption = 'This month';
                field(ProjectNext1; GetProjectTarget(1))//TODO nextmonth version
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(1, true);//TODO nextmonth version
                    Visible = IsVisibleProjectNextMonth1;
                }
                field(ProjectNext2; GetProjectTarget(2))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(2, true);
                    Visible = IsVisibleProjectNextMonth2;
                }
                field(ProjectNext3; GetProjectTarget(3))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(3, true);
                    Visible = IsVisibleProjectNextMonth3;
                }
                field(ProjectNext4; GetProjectTarget(4))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(4, true);
                    Visible = IsVisibleProjectNextMonth4;
                }
                field(ProjectNext5; GetProjectTarget(5))
                {
                    ApplicationArea = All;
                    DrillDownPageId = "BET PLAN Targets";
                    CaptionClass = '3,' + GetProject(5, true);
                    Visible = IsVisibleProjectNextMonth5;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        IsVisibleProjectCurrentMonth1 := false;
        IsVisibleProjectCurrentMonth2 := false;
        IsVisibleProjectCurrentMonth3 := false;
        IsVisibleProjectCurrentMonth4 := false;
        IsVisibleProjectCurrentMonth5 := false;
        GetEmployeeProjects();
    end;

    var
        IsVisibleProjectCurrentMonth: array[5] of Boolean;
        IsVisibleProjectCurrentMonth1, IsVisibleProjectCurrentMonth2, IsVisibleProjectCurrentMonth3, IsVisibleProjectCurrentMonth4, IsVisibleProjectCurrentMonth5 : Boolean;

        IsVisibleProjectNextMonth: array[5] of Boolean;
        IsVisibleProjectNextMonth1, IsVisibleProjectNextMonth2, IsVisibleProjectNextMonth3, IsVisibleProjectNextMonth4, IsVisibleProjectNextMonth5 : Boolean;
        EmployeePlansCurrentMonth: array[10] of Text;
        EmployeePlansNextMonth: array[10] of Text;

    local procedure GetEmployeeProjects()
        i: Integer;
    begin
        i := 1;
        if ExistsPlanCurrentMonth() then begin
            if Rec.FindSet() then
                repeat
                    EmployeePlansCurrentMonth[i] := Rec.ADG;
                    IsVisibleProjectCurrentMonth[i] := true;
                    i += 1;
                until Rec.Next() = 0;
            IsVisibleProjectCurrentMonth1 := IsVisibleProjectCurrentMonth[1];
            IsVisibleProjectCurrentMonth2 := IsVisibleProjectCurrentMonth[2];
            IsVisibleProjectCurrentMonth3 := IsVisibleProjectCurrentMonth[3];
            IsVisibleProjectCurrentMonth4 := IsVisibleProjectCurrentMonth[4];
            IsVisibleProjectCurrentMonth5 := IsVisibleProjectCurrentMonth[5];
        end;
        if ExistsPlanNextMonth() then begin
            if Rec.FindSet() then
                repeat
                    EmployeePlansNextMonth[i] := Rec.ADG;
                    IsVisibleProjectNextMonth[i] := true;
                    i += 1;
                until Rec.Next() = 0;
            IsVisibleProjectNextMonth1 := IsVisibleProjectNextMonth[1];
            IsVisibleProjectNextMonth2 := IsVisibleProjectNextMonth[2];
            IsVisibleProjectNextMonth3 := IsVisibleProjectNextMonth[3];
            IsVisibleProjectNextMonth4 := IsVisibleProjectNextMonth[4];
            IsVisibleProjectNextMonth5 := IsVisibleProjectNextMonth[5];
        end;
    end;

    local procedure GetProject(FieldNo: Integer; isNextMonth: Boolean): Text //TODO nextmonth version
    begin
        if ExistsPlanCurrentMonth() then
            exit(EmployeePlansCurrentMonth[FieldNo])
        else
            exit('');
    end;

    local procedure GetProjectTarget(FieldNo: Integer): Decimal //TODO nextmonth version
    var
        User: Record User;
        CurrentUser: Code[20];
        Days: Decimal;
    begin
        if ArrayLen(EmployeePlansCurrentMonth) <> 0 then begin
            Rec.SetRange(ADG, EmployeePlansCurrentMonth[FieldNo]);
            if Rec.FindFirst() then
                Days := Rec.Days;
            exit(Days);
        end;
    end;

    local procedure ExistsPlanCurrentMonth(): Boolean
    var
        User: Record User;
        CurrentUser: Code[20];
        CurrentMonth: Date;
    begin
        User.Get(Database.UserSecurityId());
        CurrentUser := Format(User."Full Name", 4);
        Rec.Reset();
        Rec.SetRange("Employee Code", CurrentUser);

        CurrentMonth := DMY2Date(1, Date2DMY(Today, 2), Date2DMY(Today, 3));
        Rec.SetRange(Month, CurrentMonth, CalcDate('<CM>', CurrentMonth));
        if Rec.FindSet() then
            exit(true)
        else
            exit(false);
    end;

    local procedure ExistsPlanNextMonth(): Boolean
    var
        User: Record User;
        CurrentUser: Code[20];
        NextMonth: Date;
        Month: Integer;
    begin
        User.Get(Database.UserSecurityId());
        CurrentUser := Format(User."Full Name", 4);
        Rec.Reset();
        Rec.SetRange("Employee Code", CurrentUser);

        if Date2DMY(Today, 2) = 12 then
            Month := 12
        else
            Month := Date2DMY(Today, 2) + 1;
        NextMonth := DMY2Date(1, Month, Date2DMY(Today, 3));
        Rec.SetRange(Month, NextMonth, CalcDate('<CM>', NextMonth));
        if Rec.FindSet() then
            exit(true)
        else
            exit(false);
    end;
}
