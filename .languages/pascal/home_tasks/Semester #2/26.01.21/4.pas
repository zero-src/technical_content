const PI = 3.14159265358979323846;

function _L(r: real): real := 2 * PI * r;
function _S(r: real): real := PI * sqr(r);

var r, length, square: double;

begin
  r := readreal('r:');
  
  print($'Length: {_L(r)}{#13}Square: {_S(r)}');
end.