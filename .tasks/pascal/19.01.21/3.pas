type M = set of 0..99;

var cnt, n: integer;
    A: M;

begin
  n := readinteger('n:');
  A := [];

  cnt := 0;
  
  print('input:');
  for var i := 1 to n do
    include(A, readinteger);
  
  for var i := 0 to 99 do
    cnt += i in A ? 1 : 0;
  
  print('Ответ:', cnt);
end.