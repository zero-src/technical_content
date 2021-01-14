type M = set of integer;

var M1, M2: M;

begin
  M1 := [1, 2, 3];
  M2 := [1, 2, 3, 4];
  
  print('Ответ:', M1 <= M2);
end.