table 50106 "BET PLAN Month"
{
    Caption = 'Month';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Month; Code[5])
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Month)
        {
            Clustered = true;
        }
    }
}
