const ln = 10;
var a: array [1..ln] of integer;
    n, i, n_count: integer;
    avr: real;
    
begin
  n := readinteger('n:');
  (n_count, avr) := (0, 0);
  
  for i := 1 to n do
    a[i] := readinteger;
  
  for i := 1 to n do
    if a[i] < 0 then begin
      n_count += 1;
      avr += a[i];
    end;
  
  avr := n_count > 0 ? avr / n_count : 0;
  print($'negatives: {n_count}{#13}average: {avr}');
end.