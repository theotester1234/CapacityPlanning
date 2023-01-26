codeunit 50103 "BET PLAN Filter"
{
    var
        Options: Option Current,Next;

    procedure SetFilterUser(var Plan: Record "BET PLAN Plan")
    var
        User: Record User;
        CurrentUser: Code[20];
    begin
        User.Get(Database.UserSecurityId());
        CurrentUser := Format(User."Full Name", 4);
        Plan.Reset();
        Plan.SetRange("Employee Code", CurrentUser);
    end;

    procedure SetFilterMonth(var Plan: Record "BET PLAN Plan"; Option: Option)
    var
        Month: Date;
        MonthNo: Integer;
    begin
        case Option of
            Options::Current:
                begin
                    Month := DMY2Date(1, Date2DMY(Today, 2), Date2DMY(Today, 3));
                    Plan.SetRange(Month, Month, CalcDate('<CM>', Month));
                end;
            Options::Next:
                begin
                    if Date2DMY(Today, 2) = 12 then
                        MonthNo := 12
                    else
                        MonthNo := Date2DMY(Today, 2) + 1;
                    Month := DMY2Date(1, MonthNo, Date2DMY(Today, 3));
                    Plan.SetRange(Month, Month, CalcDate('<CM>', Month));
                end;
        end;
    end;
}