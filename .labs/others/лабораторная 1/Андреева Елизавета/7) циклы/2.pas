var a, b, k: real;
res: integer;

begin
  write('Введите a, b: ');
  read(a,b);
  
  res:=0;
  write('Введите числа: ');
  
  repeat
  read(k);
    if k <> 99 then
      if (k>=a) and (k<=b) then
        res += 1;
  until k=99;
  
  write('Ответ: ',res);
end.