var a: array[1..6] of integer;
    i, n, a_cnt, b_cnt: integer;

begin  
  writeln ('Введите элементы массива: ');
  for i:=1 to 6 do
    read(a[i]);
  
  //Задание а
  a_cnt := 0;
  for i := 1 to 6 do
    if a[i] mod 7 = 0 then
       a_cnt := a_cnt + 1;
    
  //Задание б
  b_cnt := 0;
  for i := 1 to 6 do
    if (a[i] mod 2 = 0) and ((a[i] < 20) or (a[i] > 29)) then
       b_cnt := b_cnt + 1;

  writeln('a) ', a_cnt);
  writeln('б) ', b_cnt);
end.