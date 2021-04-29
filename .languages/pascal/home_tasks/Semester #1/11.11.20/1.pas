const last = 20;
var arr: array [1..last] of real;
    i, leng: integer;
    max: real;
    
begin
  write('Length: '); read(leng);
  
  for i := 1 to leng do
    read(arr[i]);
  
  max := arr[2];
  for i := 4 to leng do
    if (arr[i] > max) and (i mod 2 = 0) then
      max := arr[i];
    
   write(max);
end.