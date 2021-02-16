const max_n = 20; {Максимальное количество элементов в записи}
      c_n   = 10;  {Условие в задаче (c_n >= 10)}

/// Параметры книг    
type 
  books = record
    issued : integer;
    count  : integer; 
  end;
  
  /// Данные для глобальной таблицы
  data = record
    author_name : string;
    book_name   : string;
    book        : books; 
  end;
  
  /// Массив данных типа data
  vector = array [1..max_n] of data;

/// Объявление глобальных переменных
var table: vector;

/// Упрощение отрисовки таблицы
function t(text: string; space: integer; filling: boolean := false): string;
begin
  if not filling then
    result := ' ' * (space div 2) + text + ' ' * (space div 2)
  else
    result := text * space;
end;

/// Функция отрисовки первой таблицы
procedure draw_table(size: integer; header: string; table: vector; FLAG: boolean := false; sorted: boolean := false);
const part: array [1..8] of string = (
     /// Тут находятся фрагменты таблицы, которые поэтапно будут вызываться в коде
{1}  '+' + t('-', 30, true) + '+' + t('-', 30, true) + '+' + t('-', 33, true) + '+',
{2}  '|' + t('|', 60) + '|' + t('Количество книг', 18) + '|', 
{3}  '|' + t('ФИО Автора', 20) + '|' + t('Название книги', 16) + '|' + t('-', 33, true) + '|',
{4}  '|' + t('|', 60) + '|' + t('всего', 10) + '|' + t('выданных ', 9) + '|',
{5}  '|' + t('|', 60) + '|' + t('всего', 4) + '|' + t('выданных ', 3) + '|' + t('в наличии', 2) + '|',
{6}  '+' + t('-', 30, true) + '+' + t('-', 30, true) + '+' + t('-', 15, true) + '+' + t('-', 17, true) + '+',
{7}  '+' + t('-', 30, true) + '+' + t('-', 30, true) + '+' + t('-', 9, true) + '+' + t('-', 11, true) + '+' + t('-', 11, true) + '+',
{8}  '|'
);
begin
  /// TITLE
  writeln(t(header, part[1].length-3));
  
  /// Если FLAG = true, рисуется вторая табличка
  if not FLAG then
  begin
    /// Отрисовка первых пяти строчек
    for var i := 1 to 5 do
      /// Если i делится на 5 без остатка, тогда выводится part[1], иначе part[i]
      writeln(part[i mod 5 = 0 ? 1 : i]);
    
    /// Отрисовка тела таблицы
    for var i := 1 to size do
    begin
      writeln(part[8], table[i].author_name + ' '*(30 - table[i].author_name.length), part[8], table[i].book_name:30, part[8], table[i].book.count:15, part[8], table[i].book.issued:17, part[8]);
      writeln(part[6]);
    end;
    
  /// Делаем отступ после таблицы
  writeln;  
  end
  
  /// Если FLAG = false, рисуется вторая / третья таблица
  else
    begin
      /// Отрисовка первых пяти строчек
      for var i := 1 to 4 do
        /// Если i делится на 4 без остатка, тогда выводится part[5], иначе part[i]
        writeln(part[i mod 4 = 0 ? 5 : i]);
      writeln(part[1]);
      
      /// Проверка на сортировку таблицы
      if not sorted then
        /// Если таблица не отсортирована, то рисуем это
        for var i := 1 to size do
        begin
          writeln(part[8], table[i].author_name + ' '*(30 - table[i].author_name.length), part[8], table[i].book_name:30, part[8], table[i].book.count:9, part[8], table[i].book.issued:11, part[8], (table[i].book.count - table[i].book.issued):11, part[8]);
          writeln(part[7]);
        end
      else
        /// Вывод отсортированной таблицы
        for var i := 1 to size do
          if (table[i].book.count - table[i].book.issued) < table[i].book.issued then
          begin
            writeln(part[8], table[i].author_name + ' '*(30 - table[i].author_name.length), part[8], table[i].book_name:30, part[8], table[i].book.count:9, part[8], table[i].book.issued:11, part[8], (table[i].book.count - table[i].book.issued):11, part[8]);
            writeln(part[7]);
          end;
      
    /// Делаем отступ после таблицы
    writeln;
    end;
end;

begin
  /// Ввод количества ниг в таблице list_items >= c_n (по условию)
  var list_items := readinteger('Количество книг:');

  if list_items >= c_n then
  begin
    {$region Automatic input}
    {   ::Раскомментируй если лень вводить с клавиатуры::   }
    {
      table[1].author_name := 'Верховский Вячеслав Маркович';
      table[1].book_name   := 'Новый одесский юмор';
      table[1].book.count  := 13142;
      table[1].book.issued := 7142;
      
      table[2].author_name := 'Павлов Иван Петрович';
      table[2].book_name   := 'Избранные сочинения';
      table[2].book.count  := 7632;
      table[2].book.issued := 632;
      
      table[3].author_name := 'Лернер Георгий Исаакович';
      table[3].book_name   := 'ЕГЭ-2021. Биология';
      table[3].book.count  := 103434;
      table[3].book.issued := 100000;
      
      table[4].author_name := 'Имбирева Елена Владимировна';
      table[4].book_name   := 'Своя рассада';
      table[4].book.count  := 15352;
      table[4].book.issued := 7346;
      
      table[5].author_name := 'Ибрагим Тауфик Камель';
      table[5].book_name   := 'Религии мира';
      table[5].book.count  := 17231;
      table[5].book.issued := 12433;
    }
    {$endregion}
    
    /// Ввод данных с клавиатуры
    for var i := 1 to list_items do
    begin
      readln;
      
      /// $'{тут пишется элемент для вывода} а тут сама строка'
      /// write($'Мне {age} лет!') = write('Мне ' + age + ' лет!') = write('Мне ', age, ' лет!');
      table[1].author_name := readstring($'{i}) Автор книги:');
      table[1].book_name   := readstring($'{i}) Название книги:');
      table[1].book.count  := readinteger($'{i}) Книжек сделано:');
      table[1].book.issued := readinteger($'{i}) Книжек выдано:');
      
      println(t('-', 17, true));
    end;
    
    /// Рисуем исходную таблицу
    draw_table(list_items, 'Default Table', table);
    
    /// Рисуем вторую таблицу
    draw_table(list_items, 'New Table', table, true);
    
    /// Поиск количества книг, в которых количество книг в наличии меньше чем количество выданных книг
    for var i := list_items downto 1 do
      for var j := 1 to i do
        if (table[j].book.count - table[j].book.issued) < (table[j+1].book.count - table[j+1].book.issued) then
          (table[j], table[j+1]) := (table[j+1], table[j]);
      
    /// Рисуем последнюю таблицу
    draw_table(list_items, 'Final Table', table, true, true);
  end;
end.