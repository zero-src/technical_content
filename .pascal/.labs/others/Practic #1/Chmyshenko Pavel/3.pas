var idx, s_idx: integer;
    s, l_word, tmp: string;

begin
  s := readlnstring('строка:');
  s := s.trim;
  
  l_word := '';
  
  while pos('  ', s) > 0 do
    delete(s, pos('  ', s), 1);
  
  idx := s.LastIndexOf(' ') + 2;
  for var i := idx to s.Length do
    l_word += s[i];
 
  while pos(l_word, s) > 0 do
    delete(s, pos(l_word, s), l_word.Length + 1);
  
  print(s + l_word);  
end.