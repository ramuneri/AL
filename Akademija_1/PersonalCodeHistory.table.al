table 72001 "Personal Code History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Personal Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Is Valid"; Boolean)
        {
            DataClassification = SystemMetadata;
        }
        field(4; "Error Reason"; Text[100])
        {
            DataClassification = SystemMetadata;
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
