const last = 20;
var arr: array [1..last] of integer;
    i, j, n, tmp: integer;
    
begin
  n := readinteger('n:');
  (i, j, tmp) := (0, 0, 0);
  
  for i := 1 to n do
    arr[i] := readinteger;
  
   for i := n-1 downto 1 do
     for j := 1 to i do
      if arr[j] > arr[j+1] then begin {возрастание}
        tmp := arr[j];
        arr[j] := arr[j+1];
        arr[j+1] := tmp;
      end;
      
   println('New array:');
   for i := 1 to n do
     print(arr[i]);
end.