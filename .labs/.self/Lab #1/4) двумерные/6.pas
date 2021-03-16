const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    res: array [1..o_n] of real;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  println('Введите элементы: ');
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    res[i] := 0;
    for j := 1 to m do
      if (arr[i, j] >= 0) and (res[i] = 0) then 
        res[i] := 1;
  end;
        
   for i := 1 to n do
     writeln('result[', i, ']: ', res[i], ' ');
end.