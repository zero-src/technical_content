type M = set of char;

var M1, M2: M;

begin
  M1 := ['a', 'b', 'c'];
  M2 := ['a', 'c'];
  
  print('Ответ:', M1 >= M2);
end.