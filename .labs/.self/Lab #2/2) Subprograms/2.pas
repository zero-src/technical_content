var a, b, res1, res2: real;

function sqr_s(a, b: real): real := sqr(a+b);
function sqr_d(a, b: real): real := sqr(a-b);

begin
  (a, b) := readreal2('a, b:');
  
  res1 := sqr_s(a, b);
  res2 := sqr_d(a, b);
  
  println('Квадрат суммы:', res1);
  println('Квадрат разности:', res2);
end.