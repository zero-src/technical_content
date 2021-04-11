var idx: integer;
    s, c_str: string;

function rm_all_except(s: string; your_set: set of char): string;
begin
  for var i := s.Length downto 1 do
    if not (s[i] in your_set) then
      s[i] := ' ';
    
  result := s;
end;

begin
  /// Ввод строки и удаление первых и последних пробелов
  s := readstring('string:');
  s := s.trim;
  
  /// Удаление лишних пробелов между словами
  while pos(' '*2, s) > 0 do
    delete(s, pos(' '*2, s), 1);
  
  /// Удаление лишних символов из строки
  s := rm_all_except(s, ['0'..'9', '+', '-', '.']);
  s := s.trim;
  
  /// Начальное значение строчки
  c_str := '';
  
  /// Начало цикла
  idx := s[1] in ['+', '-'] ? 2 : 1;
  
  /// Начальные значения
  if s[1] in ['+', '-'] then
  begin
    s := ' ' + s;
    idx := 2;
  end
  else
    idx := 1;
  
  /// Добавление нужных пробелов между цифрами
  for var i := idx to s.Length do
    if s[i] in ['+', '-'] then
      c_str += ' ' + s[i]
    else
      c_str += s[i];
  
  c_str := c_str.trim;
  println('Ответ:', c_str);
end.
/// ab+0.1937-1.1w12