const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of real;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      arr[i, j] := random(0, 10);
  
  for i := 1 to n do
    for j := 1 to m do
      arr[i, j] := arr[i, j] / 2;
  
  println('New array:');
  for i := 1 to n do begin
    for j := 1 to m do
      print(arr[i, j]);
  println;
  end;
end.