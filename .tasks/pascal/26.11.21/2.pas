function _F(num: integer): uint64;
begin
    result := num <= 0 ?  1 : num * f(num - 1);
end;

function _C(n, m: integer): real;
begin
  result := _F(n) / (_F(m) * _F(n - m));
end;

var n, m: integer;
    res: double;

begin
  (n, m) := readinteger2('(n, m):');
  res := _C(n, m);
  
  print('Ответ:', res);
end.