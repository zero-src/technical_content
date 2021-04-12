var copied: array [,] of integer;
    arr: array [,] of integer;
    i, j, n, m: integer;
   
begin
  (n, m) := readinteger2('(n, m):');
  
  copied := new integer[n, m];
  arr := new integer[n, m];
  
  for i := 0 to n-1 do
    for j := 0 to m-1 do begin
      arr[i, j] := random(0, 20);
      copied[i, j] := arr[i, j];
    end;
    
  println('New array:');
  for i := 0 to n-1 do begin
    for j := 0 to m-1 do
      print(copied[i, j]);
  println;
  end;
end.