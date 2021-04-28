const o_n = 20;
      o_m = 20;
      
var matr: array [1..o_n, 1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(matr[i, j]);
    
  for i := 1 to n do
    for j := 1 to m do
      if matr[i, j] mod 7 <> 0 then {аналогично второй задаче из одномерных}
         matr[i, j] += 10  
      else
         matr[i, j] -= 10;
  
  writeln('Изменённый массив');
  for i := 1 to n do begin
    for j := 1 to m do
      write(matr[i, j], ' ');
    writeln;
  end;
end.