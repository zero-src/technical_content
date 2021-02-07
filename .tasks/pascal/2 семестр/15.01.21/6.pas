type M = set of integer;

var M1, M2, DEC: M;

begin
  M1 := [1, 2, 3, 4];
  M2 := [3, 4, 1];
  
  DEC := M1 - M2;
  
  print('Ответ:', 2 in DEC);
end.