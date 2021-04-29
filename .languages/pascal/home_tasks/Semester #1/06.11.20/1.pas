var arr: array [1..10] of real;
    i, n: integer;
    a, b: real;
    
begin
  write('(n, a, b): '); 
  read(n, a, b);
  
  for i := 1 to n do
    arr[i] := a * i + b;
  
  write(arr);
end.