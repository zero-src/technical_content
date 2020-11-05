const LAST = 10;
var arr: array [1..LAST] of integer;
    i, count: integer;
   
begin
  write('array: ');
  for i := 1 to LAST do
    read(arr[i]);
  
  for i := 1 to LAST do
    if (arr[i] mod 3 = 0) and (arr[i] mod 5 <> 0) then
        count += 1;
    
  write(count);
end.