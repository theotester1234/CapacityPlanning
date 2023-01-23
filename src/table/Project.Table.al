table 50104 "BET PLAN Project"
{
    Caption = 'Project';

    fields
    {
        field(1; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            DataClassification = CustomerContent;
        }
        field(2; "Project Name"; Text[30])
        {
            Caption = 'Project Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Project No.")
        {
            Clustered = true;
        }
    }
}
