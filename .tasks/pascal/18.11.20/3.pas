{ задание 3 }
const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    max: array [1..o_n] of integer;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    max[i] := arr[i, j];
    for j := 1 to m do
      if arr[i, j] > max[i] then
        max[i] := arr[i, j];
  end;
  
  for i := 1 to n do
    writeln('max[', i, ']: ', max[i], ' ');
end.