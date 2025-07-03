page 72002 "Array Test Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                label(Info)
                {
                    ApplicationArea = All;
                    Caption = 'Click the action button in the menu to test the array code.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Run Array Test")
            {
                ApplicationArea = All;
                Caption = '0.2) Run Array Test';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    IntegerArray: array[5] of Integer;
                    MonthNames: array[3] of Text[30];
                    i: Integer;
                begin
                    Message('Populating the array...');
                    IntegerArray[1] := 100;
                    IntegerArray[2] := 200;
                    IntegerArray[3] := 300;
                    IntegerArray[4] := 400;
                    IntegerArray[5] := 500;

                    MonthNames[1] := 'January';
                    MonthNames[2] := 'February';
                    MonthNames[3] := 'March';

                    Message('0.2) The value at index 3 is: %1', IntegerArray[3]);

                    Message('0.2) Looping through all %1 values...', ArrayLen(IntegerArray));
                    for i := 1 to ArrayLen(IntegerArray) do begin
                        Message('0.2) Value at index %1 is %2', i, IntegerArray[i]);
                    end;

                    Message('0.2) Test complete!');
                end;
            }
        }
    }
}