var a:array [1..5] of integer;
  i,res_a,res_b:integer;
begin

  write('Введите пять чисел: ');
  for i:=1 to 5 do
    read(a[i]);
  
  res_a := 0;
  for i:=1 to 5 do
    if a[i] mod 2 <> 0 then
      res_a += 1;
  
  res_b := 0;
  for i:=1 to 5 do
    if (a[i] mod 11 = 4) or (a[i] mod 11 = 7) or (a[i] mod 11 = 9) then
      res_b += 1;

  write('Ответ: А)',res_a,'; Б)',res_b,';');
end.