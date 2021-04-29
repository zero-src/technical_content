begin
  var str := readstring('String:');
  
  for var i := str.Length downto 1 do begin
    delete(str, str.Length, 1);
    println(str);
  end;
  
end.