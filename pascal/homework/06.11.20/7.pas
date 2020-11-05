const LAST = 3;
var arr: array [1..LAST] of integer; 
    i, cnt, idx: integer;
    res: string[31];
   
begin
  write('array: ');
  for i := 1 to LAST do
    read(arr[i]);
  
  for i := 1 to LAST do
    if arr[i] = 100 then begin
    cnt += 1; idx := i;
    end;
      
  res := cnt = 1 ? 'Yes | index: ' + idx : 'More/Less than one number = 100';
  write(res);
end.
