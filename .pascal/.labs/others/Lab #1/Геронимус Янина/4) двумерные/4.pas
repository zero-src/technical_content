const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    sum: array [1..o_n] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    sum[i] := 0;
    for j := 1 to m do
      sum[i] += arr[i, j];
  end;
  
  write('Новый массив: ');
  for i := 1 to n do
    write(sum[i], ' ');
end.