var n: integer;

begin
  Write('Введите номер месяца: ');
  Read(n);
  
  Case n of
    1,3,5,7,8,10,12: writeln('Количество дней - 31');
    4,6,9,11: writeln('Количество дней - 30');
    2: writeln('Количество дней - 28')
  else 
    writeln('Ошибка');
  end;
end.