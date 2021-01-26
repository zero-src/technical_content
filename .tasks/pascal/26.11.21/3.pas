function _H(a, b: double): double;
begin
  result := sqrt(a*a + b*b);
end;

function _S(a, b: double): double;
begin
  result := a*b / 2;
end;

var a, b, hypotenuse, square: double;

begin
  print('(a, b):');
  read(a, b);
  
  print($'Hypotenuse: {_H(a, b)}{#13}Square: {_S(a, b)}');
end.