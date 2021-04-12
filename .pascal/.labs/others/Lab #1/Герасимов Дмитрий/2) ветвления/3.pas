var a: array [1..4] of integer;
    i, sum, k: integer;
    
begin
  write('Введите массив а: ');
  for i := 1 to 4 do
    read(a[i]);
  
  sum := 0;
  for i := 1 to 4 do
    if a[i] mod 2 = 0 then
      sum += a[i];
  
  k := 1;
  for i := 1 to 4 do
    if (a[i] mod 3 = 0) or (a[i] mod 5 = 2) or (a[i] mod 5 = 2) then
      k += 1;
    
  writeln('Ответ а: ', sum);
  writeln('Ответ б: ', k);
end.