var cnt, idx: integer;
    s: string;

begin
  /// Ввод строки и удаление первых и последних пробелов
  s := readstring('string:');
  s := s.trim;
  
  /// Удаление лишних пробелов между словами
  while pos(' '*2, s) > 0 do
    delete(s, pos(' '*2, s), 1);
  
  /// Счётчик
  idx := s.Length;
  cnt := 0;
  
  /// Удаление лишних цифр
  for var i := s.Length-1 downto 1 do
    if i <= idx then
      if s[i] = '.' then
      begin
        idx := i;
        while (s[idx+1] in '0'..'9') do
        begin
          if s[idx+1] in '0'..'9' then
             cnt += 1;
          
          if cnt > 2 then begin
             cnt -= idx = s.Length ? cnt : 1;
             
             delete(s, idx+1, 1);
             idx -= 1;
          end;
          
          if s[idx+1] in '0'..'9' then
             idx += idx < s.Length-1 ? 1 : -3;
          
          if idx < i then
             cnt := 0;
        end;
      end;    
        
  print('Ответ:', s);
end.

/// ab+0.1937-1.1