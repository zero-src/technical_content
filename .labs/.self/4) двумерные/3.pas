const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, max, col: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  col := 1;
  max := arr[1, 1];
  for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] > max then begin
        max := arr[i, j];
        col := j;
      end;
      
  print('Column:', col);
end.
