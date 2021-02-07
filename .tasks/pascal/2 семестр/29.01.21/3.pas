function fact(num: integer): uint64;
begin
    result := num = 0 ?  1 : (num * fact(num - 1));
end;

begin
  var n := readinteger('n:');
  var sum: uint64 := 0;
  
  for var i := 1 to n do
    sum += fact(i);
  
  print('Ответ:', sum);
end.