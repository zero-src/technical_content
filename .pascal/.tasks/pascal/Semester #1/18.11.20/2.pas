{ задание 2 }
const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    pos: array [1..o_n] of integer;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    pos[i] := 0;
    for j := 1 to m do
      if (arr[i, j] > 0) and (pos[i] = 0) then
        pos[i] := j;
  end;
        
   for i := 1 to n do
     writeln('str[', i, ']: ', pos[i], ' ');
end.