const LAST = 10;
var arr: array [1..LAST] of real;
    i: integer;
    
begin
  write('array: ');
  for i := 1 to LAST do
    arr[i] := readinteger;
  
  for i := 1 to LAST do
    arr[i] := arr[i] / 2;
  
  print(arr);
end.