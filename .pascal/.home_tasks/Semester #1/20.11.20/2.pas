const o_n = 20;
      o_m = 20;

label 1;   
var arr: array [1..o_n, 1..o_m] of integer;
    sum, i, j, n, m: integer;
    
begin
  1: (n, m) := readinteger2('(n, m):');
  
  if n <> m then 
    goto 1;
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  sum := 0;
  for i := 1 to n do
    for j := 1 to m do
      if i = j then
        sum += arr[i, j];
  
    writeln('sum: ', sum, ' ');
end.