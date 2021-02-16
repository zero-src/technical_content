var idx, i: integer;
    s, tmp: string;

begin
  s := readlnstring('строка:');
  s := s.trim;
  
  /// P.S Функция не моя
  /// Виталий Шайхудинов дал её
  while pos('  ', s) > 0 do
    delete(s, pos('  ', s), 1);
  
  i := 1;
  while i <= s.length do
  begin
    if (s[i] <> ' ') and (i <= s.length) then
      tmp += s[i];
    
    if (tmp.length = 3) and ((i = s.length) or (s[i+1] = ' ')) then
    begin
      i := pos(tmp, s)-1;
      delete(s, pos(tmp, s), tmp.length + 1);
      tmp := '';
    end
    else
      if tmp.length > 3 then       
         tmp := '';
      
    i += 1;
  end;
    
  write('Ответ: ', s);
end.