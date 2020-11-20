const o_n = 20;
      o_m = 20;
   
var arr: array [1..o_n, 1..o_m] of integer;
    m_num, sum, i, j, n, m: integer;
    
begin
  (n, m, m_num) := readinteger3('(n, m, m_num):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
  
  sum := 0;
  for i := 1 to n do
    for j := 1 to m do
      if i + j = m_num then
        sum += arr[i, j];
    
    sum := sum * 2;
    writeln('sum: ', sum, ' ');
end.