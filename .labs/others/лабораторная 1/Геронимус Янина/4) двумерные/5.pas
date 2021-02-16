const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    mul: array [1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for j := 1 to m do begin
    mul[j] := 1;
    for i := 1 to n do
      if arr[i, j] < 0 then
        mul[j] *= arr[i, j];
  end;
  
  writeln('Новый массив');
  for i := 1 to m do
    write(mul[i], ' ');
end. 