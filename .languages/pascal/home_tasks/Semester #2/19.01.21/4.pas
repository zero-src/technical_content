type letters = set of 'a'..'z';

var A: letters;
    n: integer;

begin
  n := readinteger('n:');
  A := [];
  
  for var i := 0 to n do
    include(A, readlnchar);
  
  print('Ответ:');
  for var i := 'a' to 'z' do
    write(i in A ? i + ' ' : '');
end.