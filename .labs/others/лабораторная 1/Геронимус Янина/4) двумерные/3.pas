const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, min, st: integer;
    
begin
  write('Размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  st := 1;
  min := arr[1, 1];
  for i := 1 to n do
    for j := 1 to m do
      if arr[i, j] < min then begin
        min := arr[i, j];
        st := i;
      end;
      
  print('Строка:', st);
end.