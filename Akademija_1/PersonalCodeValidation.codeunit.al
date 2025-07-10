codeunit 72002 "Personal Code Validator"
{
    procedure ValidateCode(PersonalCode: Code[20]; var ErrorReason: Text[100]): Boolean
    var
        History: Record "Personal Code History";
        IsValid: Boolean;
        i: Integer;
    begin
        IsValid := true;
        ErrorReason := '';

        if StrLen(PersonalCode) <> 11 then begin
            IsValid := false;
            ErrorReason := 'Asmens kodas turi būti 11 simbolių ilgio.';
        end else begin
            if not (CopyStr(PersonalCode, 1, 1) in ['1', '2', '3', '4', '5', '6']) then begin
                IsValid := false;
                ErrorReason := 'Neteisingas pirmasis skaitmuo.';
            end else begin
                if not IsDigitsOnly(PersonalCode) then begin
                    IsValid := false;
                    ErrorReason := 'Asmens kodą turi sudaryti tik skaitmenys.';
                end else if not IsValidChecksum(PersonalCode) then begin
                    IsValid := false;
                    ErrorReason := 'Neteisinga kontrolinė suma.';
                end;
            end;
        end;

        // Savinfg in history 
        History.Init();
        History."Personal Code" := PersonalCode;
        History."Is Valid" := IsValid;
        History."Error Reason" := ErrorReason;
        History.Insert();

        exit(IsValid);
    end;

    local procedure IsDigitsOnly(Input: Text): Boolean
    var
        i: Integer;
    begin
        for i := 1 to StrLen(Input) do
            if not (Input[i] in ['0' .. '9']) then
                exit(false);
        exit(true);
    end;

    local procedure IsValidChecksum(PersonalCode: Code[20]): Boolean
    var
        Weights1: array[10] of Integer;
        Weights2: array[10] of Integer;
        Sum: Integer;
        Remainder: Integer;
        CheckDigit: Integer;
        Digit: Integer;
        i: Integer;
    begin
        Weights1[1] := 1;
        Weights1[2] := 2;
        Weights1[3] := 3;
        Weights1[4] := 4;
        Weights1[5] := 5;
        Weights1[6] := 6;
        Weights1[7] := 7;
        Weights1[8] := 8;
        Weights1[9] := 9;
        Weights1[10] := 1;

        Weights2[1] := 3;
        Weights2[2] := 4;
        Weights2[3] := 5;
        Weights2[4] := 6;
        Weights2[5] := 7;
        Weights2[6] := 8;
        Weights2[7] := 9;
        Weights2[8] := 1;
        Weights2[9] := 2;
        Weights2[10] := 3;

        Sum := 0;
        for i := 1 to 10 do begin
            Evaluate(Digit, CopyStr(PersonalCode, i, 1));
            Sum += Digit * Weights1[i];
        end;
        Remainder := Sum mod 11;

        if Remainder <> 10 then
            CheckDigit := Remainder
        else begin
            Sum := 0;
            for i := 1 to 10 do begin
                Evaluate(Digit, CopyStr(PersonalCode, i, 1));
                Sum += Digit * Weights2[i];
            end;
            Remainder := Sum mod 11;
            if Remainder <> 10 then
                CheckDigit := Remainder
            else
                CheckDigit := 0;
        end;

        Evaluate(Digit, CopyStr(PersonalCode, 11, 1));
        exit(Digit = CheckDigit);
    end;
}
