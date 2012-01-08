program Brackets;
const
  MaxN = 101;
var
  F: Text;
  S: string;
  L, R, I, N: Integer;
  Cost: array[0..MaxN, 0..MaxN] of Integer;
  Mid: array[0..MaxN, 0..MaxN] of Integer;
  LC, RC: Char;

procedure WriteAnswer(var F: Text; L, R: Integer);
var
  I: Integer;
begin
  if (L = R) then
    Exit;
  I := Mid[L, R];
  if S[L] = ')' then
    begin Write(F, '()'); WriteAnswer(F, L+1, R);
    end
  else if S[L] = ']' then
    begin Write(F, '[]'); WriteAnswer(F, L+1, R);
    end
  else if S[R] = '(' then
    begin WriteAnswer(F, L, R-1); Write(F, '()');
    end
  else if S[R] = '[' then
    begin WriteAnswer(F, L, R-1); Write(F, '[]');
    end
  else if I > 0 then
    begin
      Write(F, S[L]);
      WriteAnswer(F, L+1, I-1);
      Write(F, S[I]);
      WriteAnswer(F, I+1, R);
    end
  else
    begin
      WriteAnswer(F, L, I-1);
      Write(F, S[I]);
      WriteAnswer(F, I+1, R-1);
      Write(F, S[R]);
    end;
end;

begin
  Assign(F, 'bracket.in');
  Reset(F);
  ReadLn(F, S);
  Close(F);

  N := Length(S);

  FillChar(Cost, SizeOf(Cost), 0);
  FillChar(Mid, SizeOf(Mid), 0);
  for I := 1 to N do
    Cost[I, I] := 1;

  for I := 1 to N - 1 do
    for L := 1 to N - I do
      begin
        R := L + I;
        if (S[L] = ')') or (S[L] = ']') then
          Cost[L, R] := Cost[L+1, R] + 1
        if (S[R] = '(') or (S[R] = '[') then
          Cost[L, R] := Cost[L, R-1] + 1
        else
          begin
            Cost[L, R] := Maxint;
            for J := L + 1 to R - 1 do
              begin
                {...}
              end;
          end
        else
          Cost[L, R] := 1;
      end;

  Assign(F, 'bracket.out');
  Rewrite(F);
  WriteAnswer(F, 1, Length(S));
  WriteLn(F);
  Close(F);
end.
