begin
  var str := readstring('String');
  var k := readchar('Char to delete:');
    
  for var i := str.length downto 1 do
    if str[i] = k then
      delete(str, i, 1);
    
  print(str);
end.