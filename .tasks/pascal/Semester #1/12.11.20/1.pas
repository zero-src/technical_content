const last = 20;
var arr: array [1..last] of integer;
    i, j, n: integer;
    
begin
  n := readinteger('n:');
  (i, j) := (0, 0);
   
   for i := 1 to n do
     arr[i] := readinteger;
   
   for i := n downto 1 do
     for j := 1 to i do
       if arr[j] < arr[j+1] then
         (arr[j], arr[j+1]) := (arr[j+1], arr[j]);
       
   for i := 1 to n do
     print(arr[i]);
end.