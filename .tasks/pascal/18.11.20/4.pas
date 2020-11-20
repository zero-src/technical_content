{ задание 4 }
const o_n = 20;
      o_m = 20;
      
var arr:   array [1..o_n, 1..o_m] of integer;
    c_min: array [1..o_n] of integer;
    min:   array [1..o_n] of integer;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    min[i] := arr[i, 1];
    for j := 1 to m do
      if arr[i, j] < min[i] then
        min[i] := arr[i, j];
  end;
  
  for i := 1 to n do begin
    c_min[i] := 0;
    for j := 1 to m do
      if arr[i, j] = min[i] then
        c_min[i] := c_min[i] + 1;
  end;
      
  for i := 1 to n do
    writeln('min[', i, ']: ', c_min[i], ' ');
end.