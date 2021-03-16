const n = 6;

function fct(num: integer): biginteger;
begin
    result := (num = 0) ?  1 : (num * fct(num - 1));
end;

var matr: array [1..n, 1..n] of real;
    p, s: byte;
    
begin
  p := readinteger('Precision:');
  s := p*2+3;
  
  for var i := 1 to n do
    for var j := 1 to n do
      matr[i, j] := (2-(j-3)**2)*(j-5.7) / fct(i);
    
  println('New array:');
  for var i := 1 to n do
  begin
    for var j := 1 to n do
      write(matr[i, j]:s:p);
    println; 
  end;
end.