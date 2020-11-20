const last = 20;

var arr: array [1..last] of integer;
    min, i, j, leng, idx, cnt: integer;

begin
  write('Length: '); read(leng);
  
  for i := 1 to leng do
    read(arr[i]);
  
  ///Поиск минимума
  min := arr[1];
  idx := 1;
  for i := 2 to leng do
    if arr[i] < min then begin
       min := arr[i];
       idx := i;
    end;
  

  for i := leng downto idx do
    if arr[i] = min then begin
      for j := i to leng - 1 do
        arr[j] := arr[j+1];
    leng := leng - 1;
  end;
  
  writeln('New array: ');
    for i:=1 to leng do
      write(arr[i],' ');
end.