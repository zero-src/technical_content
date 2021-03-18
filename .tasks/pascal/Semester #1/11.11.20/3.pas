const last = 20;
var arr: array [1..last] of integer;
    i, idx, leng: integer;

begin
  write('Length: '); read(leng);
  
  for i := 1 to leng do
    read(arr[i]);
  
  leng := leng + 1;
  for i := leng downto 2 do
    arr[i] := arr[i-1];
  
  arr[1] := 0;
  writeln('New array: ');
    for i:=1 to leng do
      write(arr[i],' ');
end.