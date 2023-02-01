codeunit 50100 "BET PLAN Init Months"
{
    /// <summary>
    /// Initializes the Table "BET PLAN Month" based on how many months are left in the current year. 
    /// </summary>
    procedure Init()
    var
        Month: Record "BET PLAN Month";
        MonthAsCode: Codeunit "BET PLAN Month as Code";
        StartMonth: Integer;
        i: Integer;
    begin
        Month.DeleteAll();
        StartMonth := Date2DMY(Today, 2);
        for i := StartMonth to 12 do begin
            Month.Init();
            Month.Month := MonthAsCode.GetMonthAsCode(i);
            Month.Insert();
        end;
    end;
}
