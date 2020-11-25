const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    max, i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
      
  max := arr[1, 1]; 
  for i := 1 to n do
    for j := 1 to m do
      if (i = 1) or (i = n) then
        if arr[i, j] > max then
        max := arr[i, j];
  
    writeln('max: ', max, ' ');
end.
