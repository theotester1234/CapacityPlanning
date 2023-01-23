table 50105 "BET PLAN Employee"
{
    Caption = 'Employee';

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
            DataClassification = CustomerContent;
        }
        field(2; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Employee Code")
        {
            Clustered = true;
        }
    }
}
