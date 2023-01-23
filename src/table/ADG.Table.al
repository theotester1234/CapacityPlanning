table 50103 "BET PLAN ADG"
{
    Caption = 'ADG';

    fields
    {
        field(1; ADG; Code[20])
        {
            Caption = 'Agile Development Group';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; ADG)
        {
            Clustered = true;
        }
    }
}
