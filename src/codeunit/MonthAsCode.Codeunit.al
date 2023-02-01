codeunit 50101 "BET PLAN Month as Code"
{
    /// <summary>
    /// Returns the given Month as Text with year and leading 0 if needed.
    /// </summary>
    /// <param name="Month">Number of month in dynamic column : Integer</param>
    /// <returns>YY-MM : Text</returns>
    procedure GetMonthAsCode(Month: Integer): Text
    var
        Year: Integer;
        MonthAsCode: Text;
    begin
        Year := Date2DMY(Today, 3) - 2000;

        if Month >= 10 then
            MonthAsCode := Format(Year) + '-' + Format(Month)
        else
            MonthAsCode := Format(Year) + '-' + '0' + Format(Month);
        exit(MonthAsCode);
    end;
}