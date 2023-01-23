table 50101 "BET PLAN Plan"
{
    Caption = 'Plan';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; ADG; Code[20])
        {
            Caption = 'ADG';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN ADG";
        }
        field(3; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN Project";
        }
        field(4; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN Employee";
        }
        field(5; Month; Date)
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
        field(6; Days; Decimal)
        {
            Caption = 'Days';
            DataClassification = CustomerContent;
        }
        field(7; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            DataClassification = CustomerContent;
        }
        field(8; Comment; Text[250])
        {
            Caption = 'Comment';
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
