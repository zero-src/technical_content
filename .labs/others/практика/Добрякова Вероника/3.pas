const wrd: array of string = ('ш', 'и', 'н', 'а');

begin
  var s := readstring('string:');
  var idx := 0;
  
  for var i := 1 to s.length do
    if (s[i] = wrd[idx]) and (idx < 3) then 
        idx += 1;
      
  println(idx < 3 ? 'Нельзя' : 'Можно');
end.