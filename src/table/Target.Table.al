table 50102 "BET PLAN Target"
{
    Caption = 'Target';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN Employee";
        }
        field(3; Month; Date)
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
        field(4; Days; Decimal)
        {
            Caption = 'Days';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}


