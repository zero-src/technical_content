const o_n = 20;
      o_m = 20;
      
var matr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m, max: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(matr[i, j]);
  
  max := matr[1, 1];
  for i := 1 to n do
    for j := 1 to m do
      if matr[i, j] > max then
        max := matr[i, j];
      
  writeln('Максимум: ', max);
end.