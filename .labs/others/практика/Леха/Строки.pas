var s,s2:string;
    count,i:integer;
begin
  
  s:=readstring($'Введите строку:{s}');
  s:=s.trim; // Удаление пробелов в начале и конце строки
  
  while pos('  ',s)>0 do
    delete(s,pos('  ',s),1); // Удаление пробелов между слов
  
  (count,s2):=(0,'');
  
  for i:=s.Length downto 1 do
  begin
    if s[i]=' ' then
    begin
      s2+=copy(s,i+1,count)+' '; // Копирование слов в новую строку
      count:=0;
    end
    else
      count+=1;
  end;
    
  s2+=copy(s,i,count);
  println($'Полученная строка: {s2}');
  
end.