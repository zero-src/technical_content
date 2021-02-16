﻿const n=10;
type data = record
  book, FIO: string;
  year, count: integer;
  price, allprice: real;
end;

var v:array [1..n] of data;
 i, j, result_count:integer; result_price:real;
 begin

    v[1].FIO    := 'Быков Дмитрий Львович';
    v[1].book   := 'Июнь';
    v[1].year   := 2007;
    v[1].count  := 7625;
    v[1].price  := 210;

    v[2].FIO    := 'Цаль Виталий Олегович';
    v[2].book   := 'Легкость бытия';
    v[2].year   := 2007;
    v[2].count  := 1235;
    v[2].price  := 233; 

    v[3].FIO    := 'Коробкин Илья Андреевич';
    v[3].book   := 'Вода и уши';
    v[3].year   := 2015;
    v[3].count  := 3545;
    v[3].price  := 279.99;

    v[4].FIO    := 'Кушнарёв Роман Ильич';
    v[4].book   := 'Изучение стрел';
    v[4].year   := 2019;
    v[4].count  := 9547;
    v[4].price  := 79;

    v[5].FIO    := 'Кузьмин Никита Алексеевич';
    v[5].book   := 'Аншенты';
    v[5].year   := 2021;
    v[5].count  := 3158;
    v[5].price  := 99.99;

    v[6].FIO    := 'Березин Алексей Владимирович';
    v[6].book   := 'Всё о деньгах';
    v[6].year   := 2013;
    v[6].count  := 5348;
    v[6].price  := 1299.99;

    v[7].FIO    := 'Миненко Владимир Максимович';
    v[7].book   := 'Ненужные вещи';
    v[7].year   := 2017;
    v[7].count  := 7355;
    v[7].price  := 350;

    v[8].FIO    := 'Ван-шу-ди Кристина Алексеевна';
    v[8].book   := 'Красота';
    v[8].year   := 2003;
    v[8].count  := 6525;
    v[8].price  := 275;

    v[9].FIO    := 'Думчев Алексей Олегович';
    v[9].book   := 'Рыжий';
    v[9].year   := 2002;
    v[9].count  := 6578;
    v[9].price  := 1488;

    v[10].FIO   := 'Охлобыстин Иван Васильевич';
    v[10].book  := 'Магнификус II';
    v[10].year  := 2021;
    v[10].count := 9485;
    v[10].price := 1000;

writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |                                            Original Table                                            |');
writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |             ФИО автора             |  Название книги  |  Год издания  | Количество | Стоимость книги |');
writeln('  +------------------------------------+------------------+---------------+------------+-----------------+');
  for i:=1 to n do begin
writeln('  |',v[i].FIO:30,'      |',v[i].book:16,'  | ',v[i].year:8,'      |',v[i].count:8,'    |',v[i].price:8,' руб.    |');
writeln('  +------------------------------------+------------------+---------------+------------+-----------------+'); end; write($'{#13}{#13}{#13}');

  for i:=1 to n-1 do
    for j:=i+1 to n do
      if v[i].fio[1]>v[j].fio[1] then
        (v[i],v[j]):=(v[j],v[i]);

writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |                                            Sort by Author                                            |');
writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |             ФИО автора             |  Название книги  |  Год издания  | Количество | Стоимость книги |');
writeln('  +------------------------------------+------------------+---------------+------------+-----------------+');
  for i:=1 to n do begin
writeln('  |',v[i].FIO:30,'      |',v[i].book:16,'  | ',v[i].year:8,'      |',v[i].count:8,'    |',v[i].price:8,' руб.    |');
writeln('  +------------------------------------+------------------+---------------+------------+-----------------+'); end; write($'{#13}{#13}{#13}');

writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |                                             Sort by year                                             |');
writeln('  +------------------------------------------------------------------------------------------------------+');
writeln('  |             ФИО автора             |  Количество книг изданных в этом году  |  Общая стоимость книг  |');
writeln('  +------------------------------------+----------------------------------------+------------------------+');

  for i:=1 to n do
    if v[i].year=2021 then begin
      result_count+=v[i].count;
      v[i].allprice:=v[i].price*v[i].count;
      result_price+=v[i].allprice;
      
writeln('  |',v[i].FIO:30,'      |                 ',v[i].count:5,'                  |  ',v[i].allprice:12,' руб.     |');
writeln('  +------------------------------------+----------------------------------------+------------------------+'); end;
writeln('  |               Итого:               |                 ',result_count:5,'                  |  ',result_price:12,' руб.     |');
writeln('  +------------------------------------+----------------------------------------+------------------------+');
end.