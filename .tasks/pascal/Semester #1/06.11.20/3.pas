const LAST = 10;
var arr: array [1..LAST] of integer;
    i: integer;
   
begin
  write('array: ');
  for i := 1 to LAST do
    read(arr[i]);
  
  for i := 1 to LAST do
    if arr[i].IsEven then
       arr[i] := arr[i] div 2;
    
  write(arr);
end.