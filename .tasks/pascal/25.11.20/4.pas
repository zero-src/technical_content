begin
  var str := readstring('String:');
  var cnt := 0;
  
  for var i := str.length downto 1 do
    if (i mod 2 = 0) and (str[i] = 'u') then
      cnt += 1;
    
  print(cnt);
end.