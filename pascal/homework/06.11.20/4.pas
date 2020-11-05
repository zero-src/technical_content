const LAST = 10;
      A = 1;
      B = 5;
      
var arr: array [1..LAST] of real;
    reserved: array [A..B] of real;
    i: integer;
    sum: real;
    
begin
  for i := a to b do
    reserved[i] := i;
  
  write('array: ');
  for i := 1 to LAST do
    read(arr[i]);
  
  for i := 1 to LAST do
    if arr[i] in reserved then
      sum += arr[i];
  
  write('sum: ', sum);
end.