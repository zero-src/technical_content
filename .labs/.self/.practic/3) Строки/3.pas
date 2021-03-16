var len, idx: integer;
    s, c_string: string;

begin
  /// Ввод строки и удаление первых и последних пробелов
  s := readstring('string:');
  s := s.trim;
  
  /// Удаление лишних пробелов между словами
  while pos(' '*2, s) > 0 do
    delete(s, pos(' '*2, s), 1);
  
  /// Начальное значение
  c_string := '';
  
  /// Удаление лишних цифр
  while pos('.', s) <> 0 do
  begin
    /// Удаление символов до точки (включительно)    
    c_string += copy(s, 1, pos('.', s));
    delete(s, 1, pos('.', s));
    
    /// Обновление переменных
    idx := 1;
    len := 0;
    
    /// Количество цифр в числе
    while (idx <= s.Length) and ((s[idx] >= '0') and (s[idx] <= '9')) do
      (len, idx) := (len + 1, idx + 1);
    
    /// Удаление лишнего
    if len > 2 then
       delete(s, 3, len - 2);
  end;
  
  c_string += s;
  println('Ответ:', c_string);
end.
/// ab+0.1937-1.1