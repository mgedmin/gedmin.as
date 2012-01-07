program LTT;
{ Lithuanian Text Tool version 0.9.0  (2001-04-19) }
{ Copyright (c) 1999-2001 Marius Gedminas <mgedmin@delfi.lt> }

{   This program is free software; you can redistribute it and/or modify }
{   it under the terms of the GNU General Public License as published by }
{   the Free Software Foundation; either version 2 of the License, or    }
{   (at your option) any later version.                                  }
{                                                                        }
{   This program is distributed in the hope that it will be useful,      }
{   but WITHOUT ANY WARRANTY; without even the implied warranty of       }
{   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        }
{   GNU General Public License for more details.                         }
{                                                                        }
{   You should have received a copy of the GNU General Public License    }
{   along with this program; if not, write to the Free Software          }
{   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.            }

{ $Id: ltt.pas,v 1.16 2001/04/18 23:45:11 mg Exp $ }

{ Compiles with Free Pascal 0.99.14 }
{               Borland Pascal 7.0 }
{               Borland Delphi 5.0 (after converting \n to \r\n in source) }

{ TODO: }
{   nicer cmdline parsing }
{   wildcard expansion for poor DOS/Windows users }
{   help does not fit in 25 lines, maybe do something? }

{ -------------------------------------------- Definitions ---------------- }

{$IFDEF Win32}
  {$DEFINE Delphi}              { Borland Delphi 2.0+ }
{$ENDIF}

{$IFDEF VER60}                  { Turbo Pascal 6.0 }
  {$DEFINE BP}
{$ENDIF}
{$IFDEF VER70}                  { Borland Pascal 7.0 }
  {$DEFINE BP}
{$ENDIF}

{$IFDEF Delphi}
{$APPTYPE Console}
uses
  SysUtils;
{$ELSE}
uses
  Dos;
{$ENDIF}

const
  Version = '0.9.0';

type
  TLitEnc = (leASCII, le775, le770, le773, leLat7, leLat4);
const
  LowLitEnc = Succ(leASCII);
  HighLitEnc = High(TLitEnc);

const
  LitEnc: array[TLitEnc] of string[40] = (
    'ASCII',
    '772/774/775',
    '770 (IBM Baltic)',
    '771/773/KBL',
    'Latin-7/ISO-8859-13/Baltic-RIM/ANSI-1257',
    'Latin-4/ISO-8859-4/Latin-6/ISO-8859-10');
  LitEncNames: array[TLitEnc] of string = (
    'ascii',
    '772 774 775',
    '770',
    '771 773 kbl',
    'lat7 latin-7 iso-8859-13 brim baltic-rim 1257',
    'lat4 latin-4 iso-8859-4 lat6 latin-6 iso-8859-10');

  LitChars: array[TLitEnc, 1..18] of Char = (
    #$41#$43#$45#$45#$49#$53#$55#$55#$5A#$61#$63#$65#$65#$69#$73#$75#$75#$7A,   { 'ACEEISUUZaceeisuuz', }
    #$B5#$B6#$B7#$B8#$BD#$BE#$C6#$C7#$CF#$D0#$D1#$D2#$D3#$D4#$D5#$D6#$D7#$D8,   { 'µ∂∑∏Ωæ∆«œ–—“”‘’÷◊ÿ', }
    #$8F#$80#$8B#$90#$AD#$9F#$A7#$A6#$92#$85#$87#$8A#$82#$8D#$9E#$97#$96#$91,   { 'èÄãê≠üß¶íÖáäÇçûóñë', }
    #$DC#$DE#$F0#$F2#$F4#$F6#$F8#$FA#$FC#$DD#$DF#$F1#$F3#$F5#$F7#$F9#$FB#$FD,   { '‹ﬁÚÙˆ¯˙¸›ﬂÒÛı˜˘˚˝', }
    #$C0#$C8#$C6#$CB#$C1#$D0#$D8#$DB#$DE#$E0#$E8#$E6#$EB#$E1#$F0#$F8#$FB#$FE,   { '¿»∆À¡–ÿ€ﬁ‡ËÊÎ·¯˚˛', }
    #$A1#$C8#$CA#$CC#$C7#$A9#$D9#$DE#$AE#$B1#$E8#$EA#$EC#$E7#$B9#$F9#$FE#$BE);  { '°» Ã«©ŸﬁÆ±ËÍÏÁπ˘˛æ'); }

{ -------------------------------------------- Portability ---------------- }

{$IFDEF Delphi}

function FExpand(const S: string): string;
begin
  FExpand := ExpandFileName(S);
end;

type
  PathStr = string;
  DirStr = string;
  NameStr = string;
  ExtStr = string;

procedure FSplit(Path: PathStr; var Dir: DirStr; var Name: NameStr; var Ext: ExtStr);
begin
  Dir := ExtractFilePath(Path);
  Name := ChangeFileExt(ExtractFileName(Path), '');
  Ext := ExtractFileExt(Path);
end;

{$ENDIF}

{ -------------------------------------------- Utilities ------------------ }

procedure Error(const Msg: string);
begin
  WriteLn('ltt: ', Msg);
  Halt(1);
end;

function Upper(const S: string): string;
var
  I: Byte;
begin
{$IFDEF Delphi}
  SetLength(Result, Length(S));
{$ELSE}
  Upper[0] := S[0];
{$ENDIF}
  for I := 1 to Length(S) do Upper[I] := UpCase(S[I]);
end;

function EqualStr(const A, B: string): Boolean;
var
  I: Byte;
begin
  EqualStr := False;
  if Length(A) <> Length(B) then Exit;
  for I := 1 to Length(A) do
    if UpCase(A[I]) <> UpCase(B[I]) then Exit;
  EqualStr := True;
end;

function ReplaceExt(FileName: PathStr; NewExt: ExtStr; Force: Boolean): PathStr;
var
  Dir: DirStr; Name: NameStr; Ext: ExtStr;
begin
  FSplit(FileName, Dir, Name, Ext);
  if Force or (Ext = '') then
    ReplaceExt := Dir + Name + NewExt
  else
    ReplaceExt := FileName;
end;

function SameFName(const A, B: string): Boolean;
var
  D, D2: DirStr; N, N2: NameStr; E, E2: ExtStr;
begin
  FSplit(FExpand(A), D, N, E); if E = '.' then E := '';
  FSplit(FExpand(B), D2, N2, E2); if E2 = '.' then E2 := '';
  SameFName := EqualStr(D+N+E, D2+N2+E2);
end;

function RenameFile(const OldName, NewName: string): Boolean;
var
  F: file;
begin
  {$I-}
  Assign(F, OldName);
  Rename(F, NewName);
  {$I+}
  RenameFile := IOResult = 0;
end;

{ -------------------------------------------- Detection ------------------ }

var
  Union: array[Char] of Boolean;
  UniqTable: array[TLitEnc, Char] of Byte;
    { 0 - char not used }
    { 1 - char also used in other charsets }
    { 2 - char unique to this charset }

procedure InitUniqTable;
var
  E: TLitEnc;
  I: Integer;
  Temp: array[Char] of Byte;
begin
  FillChar(Union, SizeOf(Union), False);
  FillChar(UniqTable, SizeOf(UniqTable), 0);
  FillChar(Temp, SizeOf(Temp), 0);
  for E := LowLitEnc to HighLitEnc do
    for I := 1 to 18 do
      begin
        Inc(Temp[ LitChars[E, I] ]);
        Union[ LitChars[E, I] ] := True;
      end;
  for E := LowLitEnc to HighLitEnc do
    for I := 1 to 18 do
      if Temp[ LitChars[E, I] ] = 1 then
        UniqTable[E, LitChars[E, I] ] := 2
      else
        UniqTable[E, LitChars[E, I] ] := 1;
end;

type
  TFreqTable = array[Char] of Longint;

procedure CalcFileFreqTable(const FName: string; var T: TFreqTable; Whole: Boolean);
const
  BufSize = 1024; { If you change this, change `in the first kilobyte' bellow }
var
  F: file;
  Buf: array[0..BufSize-1] of Char;
  Size: Integer;
  I: Integer;
begin
  FillChar(T, SizeOf(T), 0);
  FileMode := 0; { Read-only access }
  {$I-}
  Assign(F, FName);
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then
    begin
      Error('File not found: '+FName);
      Exit;
    end;
  repeat
    BlockRead(F, Buf, SizeOf(Buf), Size);
    if (Size = 0) then
      Break;
    for I := 0 to Size-1 do
      Inc(T[ Buf[I] ]);
  until not Whole;
  Close(F);
end;

procedure DetectTable(const T: TFreqTable; Whole: Boolean);
const
  Uniq: array[Boolean] of Char = ' *';
  Only: array[Boolean] of Char = ' !';
var
  Counts: array[TLitEnc] of Longint;
  HasUniq: array[TLitEnc] of Boolean;
  AnyUniq: Boolean;
  HasOnly: array[TLitEnc] of Boolean;
  AnyOnly: Boolean;
  E, F: TLitEnc;
  I: Integer;
  M, Total: Longint;
  C: Char;
begin
  FillChar(Counts, SizeOf(Counts), 0); Total := 0;
  FillChar(HasUniq, SizeOf(HasUniq), False); AnyUniq := False;
  FillChar(HasOnly, SizeOf(HasOnly), True); AnyOnly := False;
  for E := LowLitEnc to HighLitEnc do
    begin
      for I := 1 to 18 do
        if T[LitChars[E, I]] > 0 then
          begin
            HasUniq[E] := HasUniq[E] or (UniqTable[E, LitChars[E, I]] = 2);
            Inc(Counts[E], T[LitChars[E, I]]);
          end;
      Inc(Total, Counts[E]);
      AnyUniq := AnyUniq or HasUniq[E];
    end;
  for C := #0 to #255 do
    if Union[C] and (T[C] > 0) then
      for E := LowLitEnc to HighLitEnc do
        if UniqTable[E, C] = 0 then
          HasOnly[E] := False;
  if Total = 0 then
    begin
      if Whole then
        WriteLn('No Lithuanian letters found')
      else
        WriteLn('No Lithuanian letters found in first kilobyte');
        { See BufSize above (in CalcFileFreqTable) }
      Exit;
    end;

  WriteLn('Probability   Charset                                      Seen characters');
  { Bogo-sort }
  repeat
    M := 0;
    for E := LowLitEnc to HighLitEnc do
      if Counts[E] > M then
        begin
          M := Counts[E];
          F := E;
        end;
    if M = 0 then Break;
    Write(Counts[F]*100 div Total:6, '%', Uniq[HasUniq[F]]:3, Only[HasOnly[F]],
          '':3, LitEnc[F], '':45-Length(LitEnc[F]));
    for I := 1 to 18 do
      if T[LitChars[F, I]] > 0 then Write(LitChars[F, I])
      else Write('.');
    WriteLn;
    Counts[F] := 0;
    AnyOnly := AnyOnly or HasOnly[F];
  until False;
  if AnyUniq then
    WriteLn('  * -- file contains Lithuanian letters unique to this charset');
  if AnyOnly then
    WriteLn('  ! -- file contains no Lithuanian letters outside of this charset');
end;

{ -------------------------------------------- Conversion ----------------- }

type
  TConvTable = array[Char] of Char;

procedure MakeConvTable(E, F: TLitEnc; var T: TConvTable);
var
  C: Char;
  I: Integer;
begin
  for C := #0 to #255 do
    T[C] := C;
  for I := 1 to 18 do
    T[ LitChars[E, I] ] := LitChars[F, I];
end;

var
  Table: TConvTable;

{$IFNDEF BP} { Free Pascal and (hopefully) other compilers }

procedure RecodeFile(const FN, ON: string);
const
  MaxBufSize = 1024;
var
  F, O: file;
  BufSize: Integer;
  Buf: array[0..MaxBufSize-1] of Char;
  I: Integer;
begin
  FileMode := 0; { Read-only access }
  {$I-}
  Assign(F, FN);
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then
    Error('File not found: '+FN);
  {$I-}
  Assign(O, ON);
  Rewrite(O, 1);
  {$I+}
  if IOResult <> 0 then
    Error('Cannot create: '+ON);
  repeat
    BlockRead(F, Buf, MaxBufSize, BufSize);
    if BufSize = 0 then Break;
    for I := 0 to BufSize-1 do
      Buf[I] := Table[ Buf[I] ];
    BlockWrite(O, Buf, BufSize);
  until False;
  Close(O);
  Close(F);
end;

procedure RecodeInPlace(const FN: string);
const
  MaxBufSize = 1024;
var
  F: file;
  BufSize: Integer;
  Buf: array[0..MaxBufSize-1] of Char;
  I: Integer;
  Pos: Longint;
begin
  FileMode := 2; { Read-write access }
  {$I-}
  Assign(F, FN);
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then
    Error('File not found: '+FN);
  Pos := 0;
  repeat
    BlockRead(F, Buf, MaxBufSize, BufSize);
    if BufSize = 0 then Break;
    for I := 0 to BufSize-1 do
      Buf[I] := Table[ Buf[I] ];
    Seek(F, Pos);
    BlockWrite(F, Buf, BufSize);
    Inc(Pos, BufSize);
  until False;
  Close(F);
end;

{$ELSE}           { Borland Pascal }

const
  MaxBufSize = 1024;
var
  { Must be in data segment }
  Buf: array[0..MaxBufSize-1] of Byte;

procedure RecodeFile(const FN, ON: string);
var
  F, O: file;
  BufSize: Word;
begin
  FileMode := 0; { Read-only access }
  {$I-}
  Assign(F, FN);
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then
    Error('File not found: '+FN);
  {$I-}
  Assign(O, ON);
  Rewrite(O, 1);
  {$I+}
  if IOResult <> 0 then
    Error('Cannot create: '+ON);
  repeat
    BlockRead(F, Buf, MaxBufSize, BufSize);
    if BufSize = 0 then Break;
    asm
      push  ds
      pop   es
      lea   si, Buf
      mov   di, si
      lea   bx, Table
      mov   cx, BufSize
    @@1:
      lodsb
      xlat
      stosb
      loop  @@1
    end;
    BlockWrite(O, Buf, BufSize);
  until False;
  Close(O);
  Close(F);
end;

procedure RecodeInPlace(const FN: string);
var
  F: file;
  BufSize: Word;
  Pos: Longint;
begin
  FileMode := 2; { Read-write access }
  {$I-}
  Assign(F, FN);
  Reset(F, 1);
  {$I+}
  if IOResult <> 0 then
    Error('File not found: '+FN);
  Pos := 0;
  repeat
    BlockRead(F, Buf, MaxBufSize, BufSize);
    if BufSize = 0 then Break;
    asm
      push  ds
      pop   es
      lea   si, Buf
      mov   di, si
      lea   bx, Table
      mov   cx, BufSize
    @@1:
      lodsb
      xlat
      stosb
      loop  @@1
    end;
    Seek(F, Pos);
    BlockWrite(F, Buf, BufSize);
    Inc(Pos, BufSize);
  until False;
  Close(F);
end;

{$ENDIF}

{ -------------------------------------------- Main ----------------------- }

function GetLitEnc(const S: string; AllowAscii: Boolean): TLitEnc;
{ Definetely not optimized.  Assumes S contains no spaces }
var
  E: TLitEnc;
begin
  if AllowAscii and
     (Pos(' '+Upper(S)+' ', ' '+Upper(LitEncNames[leASCII])+' ') <> 0) then
    begin
      GetLitEnc := leASCII;
      Exit;
    end;
  for E := LowLitEnc to HighLitEnc do
    if Pos(' '+Upper(S)+' ', ' '+Upper(LitEncNames[E])+' ') <> 0 then
      begin
        GetLitEnc := E;
        Exit;
      end;
  Error('Unknown charset: '+S);
end;

var
  FName: string;
  T: TFreqTable;
  Whole: Boolean;
  E, F: TLitEnc;
  BakName, BakExt: string;
  I: Integer;

begin
  FName := ParamStr(1);
  if (FName = '') or (FName = '-?') or (FName = '/?') then
    begin
      WriteLn('Lithuanian Text Tool version ', Version);
      WriteLn('Copyright (c) 1999-2001 Marius Gedminas <mgedmin@delfi.lt>');
      WriteLn('This is Free Software.  See the GNU General Public Licence for details.');
      WriteLn;
      WriteLn('Try to autodetect charset:');
      WriteLn('  ltt [-q] <filename>');
      WriteLn;
      WriteLn('      -q        quick mode: only check first kilobyte');
      WriteLn;
      WriteLn('Convert between charsets:');
      WriteLn('  ltt -c <charset1> <charset2> [-b <ext>] <filename> ...');
      WriteLn;
      WriteLn('      -b <ext>  create backup files with extension <ext>');
      WriteLn('                (<ext> should begin with a dot, e.g. -b .bak)');
      WriteLn;
      WriteLn('Use `-'' instead of <filename> for standard input');
      WriteLn;
      WriteLn('Possible charset values:');
      for E := LowLitEnc to HighLitEnc do
        WriteLn('  ', LitEncNames[E]);
      WriteLn('You can also use `ascii'' for <charset2>');
      WriteLn;
      WriteLn('Note: only 18 Lithuanian national letters are affected.');
      Halt;
    end;
  if FName = '-c' then
    begin { Convert }
      E := GetLitEnc(ParamStr(2), False);
      F := GetLitEnc(ParamStr(3), True);
      MakeConvTable(E, F, Table);
      BakName := ''; BakExt := '';
      I := 4;
      if ParamStr(I) = '-b' then
        begin
          BakExt := ParamStr(I+1);
          Inc(I, 2);
        end;
      if ParamStr(I) <> '-' then
        WriteLn(LitEnc[E], ' -> ', LitEnc[F], ':');
      for I := I to ParamCount do
        begin
          FName := ParamStr(I);
          if FName = '-' then
            begin
              { Recode stdin to stdout }
              RecodeFile('', '');
              Continue;
            end;
          if BakExt <> '' then
            begin
              BakName := ReplaceExt(FName, BakExt, True);
              if SameFName(BakName, FName) then
                BakName := '';
            end;
          if BakName = '' then
            begin
              WriteLn(FName);
              RecodeInPlace(FName);
            end
          else
            begin
              if not RenameFile(FName, BakName) then
                begin
                  WriteLn('Cannot create backup file ', BakName, ', ', FName,
                          'not converted');
                  Continue;
                end;
              WriteLn(FName, ' (original saved as ', BakName, ')');
              RecodeFile(BakName, FName);
              WriteLn;
            end;
        end;
    end
  else
    begin { Detect }
      Whole := True;
      I := 1;
      if (ParamCount > 1) and (FName = '-q') then
        begin
          Whole := False;
          FName := ParamStr(2); I := 2;
        end;
      InitUniqTable;
      for I := I to ParamCount do
        begin
          FName := ParamStr(I);
          WriteLn(FName);
          if FName = '-' then FName := ''; { stdin }
          CalcFileFreqTable(FName, T, Whole);
          DetectTable(T, Whole);
        end;
    end;
end.
