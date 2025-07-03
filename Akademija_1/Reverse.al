// pageextension 72003 CustomerListExt extends "Customer List"
// {
//     actions
//     {
//         addlast(Processing)
//         {
//             action(ReverseInputText)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Reverse Text';
//                 trigger OnAction()
//                 var
//                     TextInput: Text[100];
//                     TextOutput: Text;
//                     ReverseUtil: Codeunit 72004;
//                 begin
//                     TextInput := 'Programuotojas';
//                     TextOutput := ReverseUtil.ReverseText(TextInput);
//                     Message('Reversed: %1', TextOutput);
//                 end;
//             }
//         }
//     }
// }
