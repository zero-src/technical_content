type fib = set of integer;

var variable, n, i, cnt: integer;
    f: fib;
    
begin
  f := [1, 2, 3, 5, 8, 13, 21, 34];
  n := readinteger('n:');
  
  cnt := 0;
  
  for i := 1 to n do
  begin
    variable := readinteger;
    cnt += (variable in f) and (variable in 1..50) ? 1 : 0;
  end;
  
  print('Ответ:', cnt);
end.