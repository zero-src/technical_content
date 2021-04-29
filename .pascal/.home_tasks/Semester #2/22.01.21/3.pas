var num: set of 1..10000;
    i, j, n: integer;

begin
  num := [];
  
  for i := 1 to 100 do
    for j := i to 100 do
    begin
      n := i*i + j*j;
      num += [n];
    end;
  
  print('Ответ:');
  for i := 2 to 10000 do
    if i in num then 
       print(i);
end.