const
  n = 10;

type
  music = record
    FIO, Album: string;
    year: integer;
  end;

var
  used: set of string;
  a: array [1..n] of music;
  i, j, elder, older, a_count, t_count: integer;
  b: integer;

begin
  used := [];
  {b := readinteger('Сколько вы хотите ввести исполнителей');
  for  i := 1 to b do
  begin
    readln;
    a[i].FIO := readstring($'(i) Введите Псевдоним автора: ');
    a[i].Album := readstring($'(i) Введите Название альбома: ');
    a[i].year := readinteger($'(i) Введите год выпуска альбома: ');
    writeln;
  end;}
 
  a[1].fio   := 'Eminem';
  a[1].year  := 1996;
  a[1].album := 'infinite';
  
  a[2].fio   := 'Eminem';
  a[2].year  := 1999;
  a[2].album := 'Slim Shady';
  
  a[3].fio   := 'Eminem';
  a[3].year  := 2000;
  a[3].album := 'Marshall Mather';
  
  a[4].fio   := 'Eminem';
  a[4].year  := 2002;
  a[4].album := 'The Eminem Show';
  
  a[5].fio   := 'Aminem';
  a[5].year  := 2004;
  a[5].album := 'Encore';
  
  a[6].fio   := 'Eminem';
  a[6].year  := 2009;
  a[6].album := 'Relapse';
  
  a[7].fio   := 'Eminem';
  a[7].year  := 2010;
  a[7].album := 'Recovery';
  
  a[8].fio   := 'Eminem';
  a[8].year  := 2013;
  a[8].album := 'Marshall Mathers2';
  
  a[8].fio   := 'Eminem';
  a[8].year  := 2017;
  a[8].album := 'Revival';
  
  a[9].fio   := 'Eminem';
  a[9].year  := 2018;
  a[9].album := 'Kamikaze';
  
  a[10].fio   := 'Eminem';
  a[10].year  := 2020;
  a[10].album := 'to be murdered';
  
  writeln('  +--------------------------------------------------------------------------------+');
  writeln('  |         ФИО исполнителя         |   Название альбома   |  Год выпуска альбома  |');
  writeln('  +---------------------------------+----------------------+-----------------------+');
  for i := 1 to n do
  begin
    writeln('  |', a[i].fio:30, '   |', a[i].album:15, '       |', a[i].year:13, '          |');
    writeln('  +---------------------------------+----------------------+-----------------------+');
  end; writeln; writeln; writeln;
  
  for i := 1 to n - 1 do
    for j := i + 1 to n do
      if a[i].Fio > a[j].Fio then
        (a[i], a[j]) := (a[j], a[i]);
  
  writeln('  +--------------------------------------------------------------------------------+');
  writeln('  |         ФИО исполнителя         |   Название альбома   |  Год выпуска альбома  |');
  writeln('  +---------------------------------+----------------------+-----------------------+');
  for i := 1 to n do
  begin
    writeln('  |', a[i].fio:30, '   |', a[i].album:15, '       |', a[i].year:13, '          |');
    writeln('  +---------------------------------+----------------------+-----------------------+');
  end; writeln; writeln; writeln;
  
  for i := 1 to n do
    if a[i].year > 1999 then
      elder += 1
    else
      older += 1;
  
  writeln('+------------------------------+-------------------------------+'); {30,15, 1, 15}
  writeln('|                              |      Количество альбомов      |');
  writeln('|        ФИО исполнителя       |-------------------------------|');
  writeln('|                              |     всего     | после 2000 г. |');
  writeln('+------------------------------+-------------------------------+');
  
  
  for i := 1 to n do
  begin
    for j := 1 to n do
      if a[i].FIO = a[j].FIO then
        if not (a[j].FIO in used) then
        begin  
          a_count += 1;
          
          if a[j].year > 2000 then
            t_count += 1;
        end;
        
    if not (a[j].FIO in used) then    
      writeln('|', a[i].FIO + ' '*(30 - a[i].FIO.Length), '|', a_count:15, '|', t_count:15, '|');   
    
    a_count := 0;
    t_count := 0;
    used += [a[i].FIO];
  end; 
  writeln('+------------------------------+---------------+---------------+');
end.