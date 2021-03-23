const ARRAYS = 3;
      FAIL = 0;

/// New simplified types 
type bool     = boolean;
     int      = integer;
     matrix   = array [,] of int;
     database = array [1..ARRAYS] of matrix;

/// Defining global variables
var max_matrix, max_odd, num, id, __: int; 
    any_odd_numbers: bool = false;
    data: database;

/// Element position in matrix
function pos(mat: matrix; var maximum, n_idx, m_idx: int): bool; 
begin
  result := false;
  for var n := 0 to mat.RowCount - 1 do
    for var m := 0 to mat.ColCount - 1 do
      if mat[n, m].IsOdd then 
      begin
        result := true;
        
        n_idx := n;
        m_idx := m;

        maximum := mat[n, m];
        exit;
      end;
end;

/// Returns maximum element
function matrix.get_max(var maximumn: int): bool;
begin
  var n_index, m_index: int;
  var res := FAIL;
  
  result := pos(self, res, n_index, m_index);
  
  if not result then
     exit;
    
  foreach var x in self[n_index:, m_index:] do
    if x.IsOdd then
       res := x > res ? x : res; 
  
  maximumn := res;
end;

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
  
  /// Check for odd numbers
  for var i := 1 to ARRAYS do
    if not any_odd_numbers then
      any_odd_numbers := pos(data[i], __, __, __)
    else begin
      id := i;
      break;
    end;
    
  if not any_odd_numbers then
  begin 
    print('Odd numbers not found.');
    exit;
  end;
  
  /// Start value
  max_odd := FAIL;
  
  /// Max value search
  for var i := id to ARRAYS do
  begin
    if data[i].get_max(num) then 
       max_matrix := num
    else
      continue;
    
    if max_odd = FAIL then
    begin
       max_odd := max_matrix;
       continue;
    end;
    
    if max_matrix > max_odd then
      (max_odd, id) := (max_matrix, i);
  end;
  
  /// Matrix output
  matrix_output(data, id, 'Final matrix');
end.