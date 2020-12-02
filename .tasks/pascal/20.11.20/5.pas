begin
  var st := readstring('String:');
  var (_type, _error) := (0, 0);
  
  val(st, _type, _err);
  print(_err = 0 ? 'Number' : 'String');
end.