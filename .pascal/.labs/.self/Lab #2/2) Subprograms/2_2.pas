var a, b, res1, res2: real;

procedure sqr_b(a, b: real; var res1, res2: real);
begin
  res1 := sqr(a+b);
  res2 := sqr(a-b);
end;

begin
  (a, b) := readreal2('a, b:');
  
  sqr_b(a, b, res1, res2);
  
  println('Квадрат суммы:', res1);
  println('Квадрат разности:', res2);
end.