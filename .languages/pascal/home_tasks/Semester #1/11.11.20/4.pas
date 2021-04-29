const last = 20;
var arr: array [1..last] of integer;
    i, j, idx, leng: integer;
    
begin
  write('Length: '); read(leng);
  
  idx := 2; { условие сдвига }
  for i := 1 to leng do
    read(arr[i]);
   
  leng := leng + idx; 
  for i := 1 to idx do
    arr[leng - idx + i] := arr[i];
  
  writeln('New array: ');
    for i := idx + 1 to leng do
      write(arr[i],' ');
end.