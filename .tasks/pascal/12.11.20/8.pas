const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, col: integer;
    flag: integer;
  
begin
  write('(n, m): '); read(n, m);
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  flag := 0;  
  for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] = 50 then begin
         flag := flag + 1;
         col := j;
      end;
  
  if flag = 1 then
     write('m:', col) else
     write('Try again.');
end.