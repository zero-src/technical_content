const max_n = 20;
      n = 5;

type 
  ticket = record
      min : real;
      max : real;
  end;
  
  data = record
      c_name   : string;
      film     : string;
      tickets  : ticket;
  end;
  vector = array [1..max_n] of data;

var city_average, average: real;
    i, j, k, list_size: integer;
    used:set of string;
    list: vector;
    tmp: data;

begin
  while list_size < n do
  begin
    write('Введите размер списка: ');
    read(list_size);
  end;
  
  city_average := 0;
  average := 0;
  used := [];
  
  {for i := 1 to list_size do
  begin
    readln;
    write(i, '. Название кинотеатра: ');
    readln(list[i].c_name);
    
    write(i, '. Название фильма: ');
    readln(list[i].film);
    
    write(i, '. Максимальная цена: ');
    read(list[i].tickets.max);
    
    write(i, '. Минимальная цена: ');
    read(list[i].tickets.min);
    
    writeln('--------------');
  end;}
  
  {$region debug_input}
  
  list[1].c_name       := 'Каро';
  list[1].film         := 'Человек Паук';
  list[1].tickets.max  := 20;
  list[1].tickets.min  := 17;
  
  list[2].c_name       := 'Формула Кино';
  list[2].film         := 'Амфибия';
  list[2].tickets.max  := 14;
  list[2].tickets.min  := 9;
  
  list[3].c_name       := 'Каро';
  list[3].film         := 'Амфибия';
  list[3].tickets.max  := 17;
  list[3].tickets.min  := 12;
  
  list[4].c_name       := 'Каро';
  list[4].film         := 'Мумия';
  list[4].tickets.max  := 10;
  list[4].tickets.min  := 7;
  
  list[5].c_name       := 'СинемаСтар';
  list[5].film         := 'Пираньи 3D';
  list[5].tickets.max  := 24;
  list[5].tickets.min  := 22;
  
  {$endregion}
  
  writeln('                         Первая таблица');
  writeln('+-----------------+---------------------+-------------------+'); {17, 21, 19}
  writeln('|                 |                     | стоимость билетов |');
  writeln('|    Кинотеатр    |        Фильм        |-------------------|');
  writeln('|                 |                     |   min   |   max   |');
  writeln('+-----------------+---------------------+---------+---------+');
  
  for i := 1 to list_size do
  begin
    writeln('|',list[i].c_name:17, '|', list[i].film:21, '|', list[i].tickets.min:9, '|', list[i].tickets.max:9, '|');
    writeln('+-----------------+---------------------+---------+---------+');
  end;
  
  for i := list_size - 1 downto 1 do
    for j := 1 to i do
      if list[j].film > list[j+1].film then
      begin
        tmp := list[j];
        list[j] := list[j+1];
        list[j+1] := tmp;
      end;
      
  writeln('                         Вторая таблица');
  writeln('+-----------------+---------------------+-------------------+'); {17, 21, 19}
  writeln('|                 |                     | стоимость билетов |');
  writeln('|    Кинотеатр    |        Фильм        |-------------------|');
  writeln('|                 |                     |   min   |   max   |');
  writeln('+-----------------+---------------------+---------+---------+');
  
  for i := 1 to list_size do
  begin
    writeln('|',list[i].c_name:17, '|', list[i].film:21, '|', list[i].tickets.min:9, '|', list[i].tickets.max:9, '|');
    writeln('+-----------------+---------------------+---------+---------+');
    
    city_average := city_average + (list[i].tickets.max + list[i].tickets.min) / 2;
  end;
  city_average := city_average / list_size;
  
  writeln;
  writeln('            Третья таблица');
  writeln('+-----------------+-------------------+'); {17, 19}
  writeln('|    Кинотеатр    | Средняя стоимость |');
  writeln('+-----------------+-------------------+');
  
  for i := 1 to list_size do
  begin
    average := 0;
    if not (list[j].c_name in used) then
    begin
      used := used + [list[j].c_name];
      for  j := i to list_size do  
        if list[j].c_name = list[i].c_name then
        begin
          average := average + ((list[i].tickets.max + list[i].tickets.min) / 2);
          k := k + 1;
        end;
        
      average := average / k;
      
      if average < city_average then
      begin
        writeln('|',list[i].c_name:17, '|', average:19:2 , '|');
        writeln('+-----------------+-------------------+');
      end;
    end;
  end;
    
  writeln('|',' Ср. цена города ', '|', city_average:19:2 , '|');
  writeln('+-----------------+-------------------+');
end.