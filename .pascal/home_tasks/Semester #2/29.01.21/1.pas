type natur = 1..maxint;
var m, n: natur;

function NOD(a, b: natur): natur;
begin
  while a<>b do
    if a>b then
      a:=a-b
    else
      b:=b-a;
  NOD:=a
end;

begin
  m:=8;
  n:=6;
  writeln(NOD(m,n), m, n); {286}
end.
