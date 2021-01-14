var n: integer;
    
begin
  write('Введите номер дня недели: ');
  read(n);
  
  case n of
    1: write('Воскресенье');
    2: write('Понедельник');
    3: write('Вторник');
    4: write('Среда');
    5: write('Четверг');
    6: write('Пятница');
    7: write('Суббота');
  else 
    write('Ошибка');
  end;
end.