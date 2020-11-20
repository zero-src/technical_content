const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, mult: integer;
  
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      arr[i, j] := readinteger;
  
  mult := 1;
  for i := 1 to n do
    for j := 1 to m do
        mult *= arr[i, j];
    
  print(mult);
end.