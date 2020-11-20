begin
  var str := readstring('String:');
  var (_type, _err) := (0, 0);
  
  val(str, _type, _err);
  print(_type > 0 ? 'Number' : 'String');
end.