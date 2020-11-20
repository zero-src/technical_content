begin
  var list := seq( 'A', 'E', 'I', 'O', 'U');
  var str := readstring('String:');
  var cnt := 0;
  
  for var i := str.length downto 1 do
    if str[i].ToUpper in list then
      cnt += 1;
  
  print(cnt);
end.