type M = set of integer;

var M1, M2, CAT: M;

begin
  M1 := [1, 2];
  M2 := [5, 6];
  
  CAT := M1 + M2;
  
  print('Ответ:', 7 in CAT);
end.