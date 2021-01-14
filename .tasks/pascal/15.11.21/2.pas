type M = set of char;

var M1, M2: M;

begin
  M1 := ['a', 'b'];
  M2 := ['a', 'b', 'c'];
  
  print('Ответ:', M1 <> M2);
end.