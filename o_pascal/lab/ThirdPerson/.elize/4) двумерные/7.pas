const o_n = 20;
      o_m = 20;
      
var matr: array [1..o_n, 1..o_m] of integer;
    max: array [1..o_n] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(matr[i, j]);
    
  for i := 1 to n do begin
    max[i] := matr[i, 1];
    for j := 1 to m do
      if matr[i, j] > max[i] then
        max[i] := matr[i, j];
  end;
  
  write('Новый массив: ');
  for i := 1 to n do
    write(max[i], ' ');
end.