const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    flag: boolean := false;
    i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      arr[i, j] := readinteger;
  
  for i := 1 to n do
    for j := 1 to m do 
      if (arr[i, j] mod 3 = 0) and (arr[i, j] mod 5 <> 0) then
        flag := true;
  
  print(flag ? 'Yes' : 'No');
end.