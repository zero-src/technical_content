{ задание 1 }
const o_n = 20;
      o_m = 20;
      
var arr: array [1..o_n, 1..o_m] of integer;
    avr: array [1..o_n] of real;
    counter, i, j, n, m: integer;
    
begin
  (n, m) := readinteger2('(n, m):');
  
  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    
  for i := 1 to n do begin
    counter := 0;
    avr[i] := 0;
    for j := 1 to m do
      if j mod 2 = 0 then begin
        avr[i] += arr[i, j]; 
        counter += 1;
      end;
    avr[i] := avr[i] / counter;
  end;
        
   for i := 1 to n do
     writeln('str[', i, ']: ', avr[i], ' ');
end.