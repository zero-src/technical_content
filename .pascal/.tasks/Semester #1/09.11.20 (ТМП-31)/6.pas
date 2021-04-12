begin
  var str := readstring('String:');
  var (b, e, res) := (-1, -1, '');
  
  for var i := str.length downto 1 do begin
    if str[i] = str[1] then b += 1 else
    if str[i] = str[str.length] then e += 1;
  end;

  res := b > e ? 'First' : (b = e ? 'Try again' : 'Last');
  print(res);
end.