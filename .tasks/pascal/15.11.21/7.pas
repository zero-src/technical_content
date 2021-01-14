type M = set of integer;

var M1, M2, CAT: M;

begin
  M1 := [1, 2, 3];
  M2 := [1, 4, 2, 5];
  
  CAT := M1 * M2;
  
  print('Ответ:', [1, 2] <= CAT);
end.