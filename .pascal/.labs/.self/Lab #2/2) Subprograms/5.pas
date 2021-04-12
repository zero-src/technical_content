const ARRAYS = 3;
      FAIL = 0;
      
label HERE;

/// New simplified types 
type bool     = boolean;
     int      = integer;
     matrix   = array [,] of int;
     database = array [1..ARRAYS] of matrix;

/// Defining global variables
var max_odd, id, o_n, o_m, o_k: int;
    data: database;

/// Fill arrays of matrix
procedure data_input(var data: database);
begin
  for var i := 1 to ARRAYS do
  begin
    data[i] := new int[readinteger($'Matrix{i} [n]:'), readinteger($'Matrix{i} [m]:')];

    println('Your matrix:');
    data[i].Fill((n, m) -> readinteger);
  end;
end;

/// Outputs required matrix
procedure matrix_output(var data: database; idx: int; text: string := '');
begin
  println('-'*12 + #13 + text + ':');
  for var i := 0 to data[idx].RowCount - 1 do
    println(data[idx][i, :]);
end;

begin  
  /// Data input
  data_input(data);
  
   /// FAIL value
  o_k := FAIL;
  /// Check for odd numbers
  for var k := 1 to ARRAYS do
    for var i := 0 to data[k].RowCount - 1 do
      for var j := 0 to data[k].ColCount - 1 do
        if data[k][i, j].IsOdd then
        begin
          (o_n, o_m, o_k) := (i, j, k);
          max_odd := data[k][i, j];
          goto HERE;
        end;

  /// Check for odd numbers
  if o_k = FAIL then
  begin 
    print('Odd numbers not found.');
    exit;
  end;
  
  HERE:
  id := o_k;
  
  /// Max value search
  for var i := o_k to ARRAYS do
  begin
    foreach var x in data[i][o_n:,o_m:] do
      if x.IsOdd then
      begin
         max_odd := x > max_odd ? x : max_odd;
    
         if max_odd = x then
           id := i;
      end;
      
    (o_n, o_m) := (0, 0);
  end;
  
  /// Matrix output
  matrix_output(data, id, 'Final matrix');
end.