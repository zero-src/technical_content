type vec = array of real;

var a, b, c: vec;
    n: integer;

procedure input(var arr: vec; n: integer);
begin
  print('Введите массив:');
  for var i := 0 to n-1 do
    arr[i] := readreal;
end;

procedure create(var c: vec; a, b: vec);
begin
  for var i := 0 to c.Length-1 do
    c[i] := a[i] / b[i];
end;

begin
  n := readinteger('n:');
  
  a := new real[n];
  b := new real[n];
  c := new real[n];
  
  input(a, n);  
  input(b, n);
  
  create(c, a, b);
  
  print('Ответ:');
  for var i := 0 to c.Length-1 do
    print(c[i]);
end.