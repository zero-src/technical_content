var k: integer;
    s, s1: string;

begin
  s := readstring('строка:');
  s := s.trim;
  
  k := 1;
  
  /// P.S Функция не моя
  /// Виталий Шайхудинов дал её
  while pos('  ', s) > 0 do
    delete(s, pos('  ', s), 1);
  
  for var i := 1 to s.Length do
  begin
    if (i = 1) or (s[i] = ' ')then
    begin
      s1 += i = 1 ? k.ToString + ' ' : ' ' + k.ToString;
      k += 1;
    end;
    
    s1 += s[i];
  end;
  
  print('Ответ:', s1);
end.