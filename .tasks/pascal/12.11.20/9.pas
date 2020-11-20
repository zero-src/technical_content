const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, min, cnt: integer;
    flag: boolean := false;
  
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      arr[i, j] := readinteger;
  
  min := arr[1, 1];
  cnt := 0;
  
  for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] < min then 
         min := arr[i, j];
      
   for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] = min then 
         cnt := cnt + 1;
  
  print(cnt);
end.