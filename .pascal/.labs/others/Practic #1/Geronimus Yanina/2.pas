const 
  limit = 20;
  cond  = 10;
  
type 
  data = record
    /// String
    FullName: string;
    BookName: string;
    
    /// Integer
    IssueYear: integer;
  end;
  
var 
  t: array [1..cond] of data;
  used: set of string;
  i, j, Size, AllBooks, Temp: integer;
  
begin
  Size := readinteger('size:');
  used := [];
  
  /// Ввод данных
  for i := 1 to Size do
  begin
    readln;
    t[i].FullName     :=  readstring($'{i}. ФИО Автора:');
    t[i].BookName     :=  readstring($'{i}. Название книги:');
    t[i].IssueYear    := readinteger($'{i}. Год выпуска:');
    writeln('-'*15);
  end;
  
  {$region DEBUG}
  (*
    t[1].FullName   := 'Eminem';
    t[1].BookName := 'infinite';
    t[1].IssueYear  := 1996;
    
    t[2].FullName   := 'Eminem';
    t[2].BookName := 'Slim Shady';
    t[2].IssueYear  := 1999;
    
    t[3].FullName   := 'Eminem';
    t[3].BookName := 'Marshall Mather';
    t[3].IssueYear  := 2000;
    
    t[4].FullName   := 'Eminem';
    t[4].BookName := 'The Eminem Show';
    t[4].IssueYear  := 2002;
    
    t[5].FullName   := 'Aminem';
    t[5].BookName := 'Encore';
    t[5].IssueYear  := 2004;
    
    t[6].FullName   := 'Eminem';
    t[6].BookName := 'Relapse';
    t[6].IssueYear  := 2009;
    
    t[7].FullName   := 'Eminem';
    t[7].BookName := 'Recovery';
    t[7].IssueYear  := 2010;
    
    t[8].FullName   := 'Eminem';
    t[8].BookName := 'Marshall Mathers2';
    t[8].IssueYear  := 2013;
    
    t[8].FullName   := 'Eminem';
    t[8].BookName := 'Revival';
    t[8].IssueYear  := 2017;
    
    t[9].FullName   := 'Eminem';
    t[9].BookName := 'Kamikaze';
    t[9].IssueYear  := 2018;
    
    t[10].FullName   := 'Eminem';
    t[10].BookName := 'to be murdered';
    t[10].IssueYear  := 2020;
  *)
  {$endregion}
  
  /// Исходная Таблица
  writeln('+--------------------------------+----------------------+---------------+'); {32, 22, 15}
  writeln('|            ФИО Автора          |    Название книги    |  Год выпуска  |');
  writeln('+--------------------------------+----------------------+---------------+'); 
  
  for i := 1 to Size do
    writeln('|', t[i].FullName + ' '*(32 - t[i].FullName.Length), '|', t[i].BookName:22, '|', t[i].IssueYear:15, '|');
  writeln('+--------------------------------+----------------------+---------------+');
  
  /// Отсортированная Таблица
  writeln('+--------------------------------+----------------------+---------------+'); {32, 22, 15}
  writeln('|            ФИО Автора          |    Название книги    |  Год выпуска  |');
  writeln('+--------------------------------+----------------------+---------------+'); 
  
  for i := Size-1 downto 1 do
    for j := 1 to i do
      if t[j].FullName > t[j+1].FullName then
        (t[j], t[j+1]) := (t[j+1], t[j]);
      
  for i := 1 to Size do
    writeln('|', t[i].FullName + ' '*(32 - t[i].FullName.Length), '|', t[i].BookName:22, '|', t[i].IssueYear:15, '|');
  writeln('+--------------------------------+----------------------+---------------+');
  
  
  writeln('+--------------------------------+-------------------------------+'); {32, 15, 1, 15}
  writeln('|                                |      Количество альбомов      |');
  writeln('|            ФИО Автора          |-------------------------------|');
  writeln('|                                |     всего     | после 2000 г. |');
  writeln('+--------------------------------+-------------------------------+');
  
  for i := 1 to Size do
  begin
    for j := 1 to Size do
      if t[i].FullName = t[j].FullName then
        
        /// Если Автора нету в списке
        if not (t[j].FullName in used) then
        begin
          AllBooks += 1;
          
          if t[j].IssueYear > 2005 then
             Temp += 1;
        end;
      
      /// Вывод авторов без повторений
      if not (t[j].FullName in used) then    
        writeln('|', t[i].FullName + ' '*(32 - t[i].FullName.Length), '|', AllBooks:15, '|', Temp:15, '|');
      
      /// Обнуление переменных
      AllBooks := 0;
      Temp := 0;
      
      /// Обновление списка авторов
      used += [t[i].FullName];
  end;
  
  writeln('+--------------------------------+-------------------------------+');
end.