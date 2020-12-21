const o_n = 20;
      o_m = 20;
      
var matr: array [1..o_n, 1..o_m] of integer;
    mul: array [1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(matr[i, j]);
    
  for j := 1 to m do begin
    mul[j] := 1; {для каждого столбца делаем изначальный множитель 1 ибо если он будет 0, то произведение будет 0}
    for i := 1 to n do
      mul[j] *= matr[i, j];
  end;
  
  write('Новый массив: ');
  for i := 1 to m do
    write(mul[i], ' ');
end.      