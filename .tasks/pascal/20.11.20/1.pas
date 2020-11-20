const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    sum, i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
    sum := 0;
    for i := 1 to n do
        sum += arr[i, 1];
  
    writeln('sum: ', sum, ' ');
end.