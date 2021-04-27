var idx, sp_pos: integer;
    s, c_str: string;

begin
  /// Ввод строки и удаление первых и последних пробелов
  s := readstring('string:');
  s := s.trim;
  
  /// Удаление лишних пробелов между словами
  while pos(' '*2, s) > 0 do
    delete(s, pos(' '*2, s), 1);
  
  /// Начальное значение строчки
  insert(' ', s, s.Length+1);
  c_str := '';
  
  sp_pos := 0;
  idx := 0;
  
  for var i := 1 to s.CountOf(' ') do
  begin    
    c_str += copy(s, 1, pos(' ', s));
    delete(s, 1, pos(' ', s));
    
    idx += 1;
    sp_pos := idx;
    
    while idx < c_str.Length do 
    begin
      if not (c_str[idx] in ['0'..'7', '+', '-', '.']) then
        delete(c_str, sp_pos, s.Length);
      idx += 1;
    end;
  end;
  
  print('Ответ:', c_str);
end.
/// -232 1.218 +12.001 +0.12