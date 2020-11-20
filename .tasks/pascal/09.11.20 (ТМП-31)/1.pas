begin
  var str := readstring('String:');
  
  for var i := 1 to str.Length do begin
    delete(str, str.Length, 1);
    println(str);
  end;
end.