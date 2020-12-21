var a: array[1..6] of integer;
    i, n, a_cnt, b_cnt: integer;

begin  
  writeln ('Введите элементы массива: ');
  for i:=1 to 6 do
    read(a[i]);
  
  //Задание а
  for i := 1 to 6 do
    if a[i] mod 7 = 0 then
       a_cnt := a_cnt + 1;
    
  //Задание б
  for i := 1 to 6 do
    if (a[i] mod 2 = 0) and (a[i] < 20) and (a[i] > 29) then
       b_cnt := b_cnt + 1;

  writeln('a) ', cnt);
  writeln(',) ', );
end.