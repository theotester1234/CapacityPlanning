table 50100 "BET PLAN Demand"
{
    Caption = 'Demand';

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
        field(3; "Project Manager Code"; Code[20])
        {
            Caption = 'Project Manager Code';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN Employee";
        }
        field(4; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            DataClassification = CustomerContent;
            TableRelation = "BET PLAN Project";
        }
        field(5; Month; Date)
        {
            Caption = 'Month';
            DataClassification = CustomerContent;
        }
        field(6; Accounting; Decimal)
        {
            Caption = 'Accounting';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(7; "Report"; Decimal)
        {
            Caption = 'Report';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(8; Standard; Decimal)
        {
            Caption = 'Standard';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(9; Automotive; Decimal)
        {
            Caption = 'Automotive';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(10; Manufacturing; Decimal)
        {
            Caption = 'Manufacturing';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(11; Project; Decimal)
        {
            Caption = 'Project';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(12; ProServ; Decimal)
        {
            Caption = 'ProServ';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(13; Total; Decimal)
        {
            Caption = 'Total';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                GetTotal();
            end;
        }
        field(14; Comment; Text[250])
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

    procedure GetTotal()
    begin
        Total := Accounting + Report + Standard + Automotive + Manufacturing + Project + ProServ;
    end;
}
