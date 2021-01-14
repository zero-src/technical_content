var x: byte;

begin
  x := readinteger('x:');
  
  case x of
    1..5: write('Рабочий день.');
    6   : write('Суббота.');
    7   : write('Воскресенье.')
  else
    write('Error.');
  end;
end.