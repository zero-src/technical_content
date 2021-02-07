const o_n = 20;
type vec = array [0..o_n] of integer;

procedure input(a: vec; n: integer; c: char := ' ');
begin
  println('-'*14);
  for var i := 0 to n do
      a[i] := readinteger($'{c}[{i}]:');
end;

function __equation(arr: vec; n, x: integer; z: integer := 0; flag: boolean := false): real;
begin
  if not flag then
    for var i := 0 to n-1 do
      result += arr[i] * x ** (n-i)
  else
    for var i := 0 to n-1 do
      result += arr[i] * (x + z) ** (n-i);
    
  result += arr[n];
end;

var x, y, z, n, m, k: integer;
    a, b, c: vec;
    res: real;
    
begin
  (x, y, z) := readinteger3('x, y, z:');
  (n, m, k) := readinteger3('n, m, k:');
  
  input(a, n, 'a');
  input(b, m, 'b');
  input(c, k, 'c');
  
  res := (sqr(__equation(a, n, x)) - __equation(b, m, y)) / __equation(c, k, x, z, true);
  
  print('Ответ:', res);
end.