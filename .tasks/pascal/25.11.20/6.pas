begin
  var st := readstring('String:');
  var k := readchar('Char to delete:');
  
  while pos(k, st) <> 0 do
      delete(st, pos(k, st), 1);
  
  print(st);
end.