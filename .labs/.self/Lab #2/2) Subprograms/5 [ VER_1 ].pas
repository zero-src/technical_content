const ARRAYS_COUNT = 3;
      FATAL = 0;

type bool = boolean;
     int  = integer;
     mas  = array [,] of int;
     dat  = array [1..ARRAYS_COUNT] of mas;

var AnyOddNumbers: bool = false;
    MaxOdd, Idx, AMaxOdd, AMax: int;
    Data: dat;

function mas.HasOdd(var nIdx, mIdx: int): bool;
begin
  result := false;
  
  for var n := 0 to Self.RowCount - 1 do
    for var m := 0 to Self.ColCount - 1 do
      if Self[n, m].IsOdd then
      begin
        nIdx := n;
        mIdx := m;
        
        result := true;
        break;
      end;
      
  if not result then
     exit;
end;

function mas.o_max(var max: int): bool;
label OUT;
begin
  result := false;
  
  var oMax := FATAL;
  var nIdx := FATAL;
  var mIdx := FATAL;
  
  if Self.HasOdd(nIdx, mIdx) then
     result := true
  else
     goto out;
   
  foreach var x in Self[nIdx:, mIdx:] do
    if x.IsOdd and (x > oMax) then 
       oMax := x;

  out:
    max := oMax <> FATAL ? oMax : max;
end;

procedure mInput(Self: dat); extensionmethod;
begin
  for var i := 1 to ARRAYS_COUNT do
  begin
    println($'Matrix[{i}]:');
    for var n := 0 to Self[i].RowCount - 1 do
      for var m := 0 to Self[i].ColCount - 1 do
      begin
        Self[i][n, m] := readinteger;
        AnyOddNumbers := Self[i][n, m].IsOdd ? true : AnyOddNumbers;
      end;
  end;
end;

procedure mPrint(Self: dat; Idx: integer; text: string := ''); extensionmethod;
begin
  println('-'*10 + #13 + text + ':');
  
  for var i := 0 to Self[Idx].RowCount - 1 do
  begin  
    for var j := 0 to Self[Idx].ColCount -1 do
      print(Self[Idx][i, j]);
    println;
  end;
end;

begin  
  /// Matrix init
  for var i := 1 to ARRAYS_COUNT do
  begin
    Data[i] := new integer[readinteger($'Array {i} [n]:'), readinteger($'Array {i} [m]:')];
    println('-'*11);
  end;
  
  /// Input for **Data**
  Data.mInput;
  
  /// Check for odd numbers
  if not AnyOddNumbers then
  begin 
    print('Odd numbers not found.');
    exit;
  end;
  
  /// Maximm odd element
  MaxOdd := FATAL;
  Idx := FATAL;
  
  /// MaxOdd and Idx values
  for var i := 1 to ARRAYS_COUNT do
  begin
    if Data[i].o_max(AMax) then
       AMaxOdd := AMax
    else 
       Continue;
    
    if AMaxOdd > MaxOdd then
      (MaxOdd, Idx) := (AMaxOdd, i);
  end;
  
  /// Matrix output
  Data.mPrint(Idx, 'Matrix');
end.