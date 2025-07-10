page 72002 "Personal Code Checker"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Personal Code Checker';

    layout
    {
        area(content)
        {
            group("Check Personal Code")
            {
                field(PersonalCode; PersonalCode)
                {
                    ApplicationArea = All;
                }

                field(ValidationResult; ValidationResult)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(ErrorReason; ErrorReason)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Check")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Validator: Codeunit "Personal Code Validator";
                begin
                    if Validator.ValidateCode(PersonalCode, ErrorReason) then
                        ValidationResult := 'Teisingas'
                    else
                        ValidationResult := 'Neteisingas';
                end;
            }
        }
    }

    var
        PersonalCode: Code[20];
        ValidationResult: Text[30];
        ErrorReason: Text[100];
}
