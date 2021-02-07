const e_n = 20;
      e_m = 20;
      
var matr  : array [1..e_n, 1..e_m] of integer;
    vec_x : array [1..e_m] of real;
    n, m  : integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  println('array input below:');
  for var i := 1 to n do
    for var j := 1 to m do
      matr[i, j] := readinteger;
    
  for var j := 1 to m do
  begin
    vec_x[j] := 0;
    
    for var i := 1 to n do
      vec_x[j] += matr[i, j];
    
    vec_x[j] /= n;
  end;
  
  print('vec_x:');
  for var i := 1 to m do
    print(vec_x[i]);
end.