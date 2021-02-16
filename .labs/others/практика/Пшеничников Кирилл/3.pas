var s,s2:string;
    idx, i, j, k:integer;
begin
  
  s:=readstring($'Введите строку:{s}');
  s:=s.trim; // Удаление пробелов в начале и конце строки
  
  while pos('  ',s) > 0 do
    delete(s,pos('  ',s), 1); // Удаление пробелов между слов
  
  (idx, s2) := (1, '');
  
  for i := 1 to s.Length do
      if (s[i] = ' ') or (i = s.length) then
      begin
        if i = s.length then
           k := 0
        else 
           k := 1;
        
        for j := i - k downto idx do
          s2 += s[j];
        
        idx := i+1;
        s2 += ' ';
      end;
    
  println($'Полученная строка: {s2}');
end.