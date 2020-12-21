const o_n = 20;
      o_m = 20;
      
var matr: array [1..o_n, 1..o_m] of integer;
    res: array [1..o_m] of integer;
    i, j, n, m: integer;
    
begin
  write('Введите размерность массива: ');
  read(n, m);
  
  writeln('Введите элементы');
  for i := 1 to n do
    for j := 1 to m do
      read(matr[i, j]);
    
  for j := 1 to m do begin
    res[j] := 0;
    for i := 1 to n do
      if (matr[i, j] < 0) and (res[j] = 0) then 
        res[j] := 1;
  end;
  
  write('Новый массив: ');  
  for i := 1 to m do
    write(res[i], ' ');
end.