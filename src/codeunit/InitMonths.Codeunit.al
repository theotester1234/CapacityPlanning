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
        Month.DeleteAll();  // Delete current records
        StartMonth := Date2DMY(Today, 2); // get the current month as Integer
        for i := StartMonth to 12 do begin // for remaining months of the current year
            Month.Init();
            MonthAsCode.GetMonthAsCode(StartMonth);
            Month.Insert();
        end;
    end;
}
