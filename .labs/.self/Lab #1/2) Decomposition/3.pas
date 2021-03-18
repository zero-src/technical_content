var a: array [1..5] of integer;
    a_count, b_count, i: integer;

begin
  write('a[1]..a[5]: ');  
  for i := 1 to 5 do
    read(a[i]);
  
  ///Под буквой а
  a_count := 0;
  for i := 2 to 5 do
    if (a[1] < a[i]) and (a[i] < 10*a[1]) then
      a_count += 1;
    
  ///Под буквой б
  b_count := 0;
  for i := 1 to 5 do
    if (a[i] mod 7 = 3) or (a[i] mod 7 = 6) then
      b_count += 1;
    
  writeformat('a) {0}{1}b) {2}', a_count, #13, b_count)
end.