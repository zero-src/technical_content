const LAST = 10;
var arr: array [1..LAST] of real;
    i: integer;
    a, b: real;
    
begin
  write('(a, b): '); 
  read(a, b);
  
  for i := 1 to LAST do
    arr[i] := a * i + b;
  
  write(arr);
end.