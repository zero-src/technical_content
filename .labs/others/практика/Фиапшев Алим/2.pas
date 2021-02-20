const 
    last = 20;
    n = 10;

type 
    ticket = record
        cnt : integer;
        cst : integer;
    end;
    
    data = record
        c_name   : string;
        film     : string;
        tick     : ticket;
    end;
    vec = array [1..last] of data; 

var used: set of string;
    size, c_sold, c_cost, a_sold, a_cost, max, min, k: integer;
    list, n_list: vec;

begin
    used := [];

    /// N >= 10 по условию
    while size < n do
    begin
        write('Введите размер списка: ');
        read(size);
    end;

    /// Ввод элементов списка
    writeln('--------------');
    for var i := 1 to size do
    begin
        readln;
        write(i, '. Название кинотеатра: ');
        readln(list[i].c_name);
        
        write(i, '. Название фильма: ');
        readln(list[i].film);
        
        write(i, '. Билетов продано: ');
        read(list[i].tick.cnt);
        
        write(i, '. Стоимость: ');
        read(list[i].tick.cst);
        
        writeln('--------------');
    end;

    /// Ввод для быстрой проверки
    {
        list[1].c_name    := 'Каро';
        list[1].film      := 'Человек Паук';
        list[1].tick.cnt  := 202;
        list[1].tick.cst  := 17;
        
        list[2].c_name    := 'Формула Кино';
        list[2].film      := 'Амфибия';
        list[2].tick.cnt  := 142;
        list[2].tick.cst  := 9;
        
        list[3].c_name    := 'Каро';
        list[3].film      := 'Амфибия';
        list[3].tick.cnt  := 172;
        list[3].tick.cst  := 12;
        
        list[4].c_name    := 'Каро';
        list[4].film      := 'Мумия';
        list[4].tick.cnt  := 105;
        list[4].tick.cst  := 7;
        
        list[5].c_name    := 'СинемаСтар';
        list[5].film      := 'Пираньи 3D';
        list[5].tick.cnt  := 244;
        list[5].tick.cst  := 22;
    }

    /// Вывод первой таблицы
    writeln('+-----------------+---------------------+-------------------+-----------+'); {17, 21, 19, 11}
    writeln('|    Кинотеатр    |        Фильм        |  Билетов продано  | Стоимость |');
    writeln('+-----------------+---------------------+-------------------+-----------+');

    for var i := 1 to size do
    begin
        writeln('|',list[i].c_name:17, '|', list[i].film:21, '|', list[i].tick.cnt:19, '|', list[i].tick.cst:11, '|');
        writeln('+-----------------+---------------------+-------------------+-----------+');
    end;
    
    /// Вывод второй таблицы
    writeln('+-----------------+-------------------+-----------+'); {17, 19, 11}
    writeln('|    Кинотеатр    |  Билетов продано  | Стоимость |');
    writeln('+-----------------+-------------------+-----------+');

    /// Составление таблицы для вывода
    for var i := 1 to size do
    begin
        /// Если кинотеатра нету в списке использовакнных
        if not (list[i].c_name in used) then
        begin
            /// Если у кинотеатров i и j одинаковые названия
            for var j := i to size do  
                if list[j].c_name = list[i].c_name then
                begin
                    c_sold += list[j].tick.cnt;
                    c_cost += list[j].tick.cst;
                end;
            k += 1;

            /// Добавление в использованный список
            used += [list[i].c_name];

            /// Новые записи для переноса новых значений
            n_list[k] := list[i];
            n_list[k].tick.cnt := c_sold;
            n_list[k].tick.cst := c_cost;

            /// Обнуление временных переменных
            c_sold := 0;
            c_cost := 0;
        end;

        /// Общая сумма билетов
        a_sold += list[i].tick.cnt;
        a_cost += list[i].tick.cst;
    end;
    
    /// Сортировка новых записей для вывода
    for var i := k-1 downto 1 do
        for var j := 1 to i do
            if  n_list[j].tick.cnt < n_list[j+1].tick.cnt then
                (n_list[j], n_list[j+1]) := (n_list[j+1], n_list[j]);

    /// Конец вывода  второй таблицы
    for var i := 1 to k do
    begin
        writeln('|',n_list[i].c_name:17, '|', n_list[i].tick.cnt:19, '|', n_list[i].tick.cst:11, '|');
        writeln('+-----------------+-------------------+-----------+');
    end;
    
    /// Поле с итогами 
    writeln('|','Итог:            ', '|', a_sold:19, '|', a_cost:11, '|');
    writeln('+-----------------+-------------------+-----------+');

    /// Вывод последней таблицы
    writeln('+-----------------+-------------------+-----------+'); {17, 19, 11}
    writeln('|    Кинотеатр    |  Билетов продано  | Стоимость |');
    writeln('+-----------------+-------------------+-----------+');

    min := n_list[k].tick.cst;
    max := n_list[1].tick.cst;

    a_sold := 0;
    a_cost := 0;

    /// Конец вывода  второй таблицы
    for var i := 1 to k do
        if (n_list[i].tick.cst = min) or (n_list[i].tick.cst = max) then
        begin
            a_sold += n_list[i].tick.cnt;
            a_cost += n_list[i].tick.cst;

            writeln('|',n_list[i].c_name:17, '|', n_list[i].tick.cnt:19, '|', n_list[i].tick.cst:11, '|');
            writeln('+-----------------+-------------------+-----------+');
        end;

    /// Поле с итогами 
    writeln('|','Итог:            ', '|', a_sold:19, '|', a_cost:11, '|');
    writeln('+-----------------+-------------------+-----------+');
end.