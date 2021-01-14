const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    min: array [1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for j := 1 to m do begin
    min[j] := arr[1, j];
    for i := 1 to n do
      if arr[i, j] < min[j] then
        min[j] := arr[i, j];
  end;
  
  for i := 1 to m do
    writeln('min[', i, ']: ', min[i], ' ');
end.