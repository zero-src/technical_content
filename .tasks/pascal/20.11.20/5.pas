begin
  var str := readstring('String:');
  var (_type, _error) := (0, 0);
  
  val(str, _type, _err);
  print(_err = 0 ? 'Number' : 'String');
end.