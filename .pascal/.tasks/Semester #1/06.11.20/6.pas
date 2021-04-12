const LAST = 10;
      A = 1;
      B = 5;
      
var arr: array [1..LAST] of real;
    reserved: array [A..B] of real;
    i, cnt: integer;
    avr, sum: real;
    
begin
  for i := a to b do
    reserved[i] := i;
  
  write('array: ');
  for i := 1 to LAST do
    read(arr[i]);
  
  for i := 1 to LAST do
    if not ( arr[i] in reserved ) then begin
       cnt += 1; sum += arr[i];
    end;
  
  avr := sum / cnt;
  write('avr: ', avr);
end.