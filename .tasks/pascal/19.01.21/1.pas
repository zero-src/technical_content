var CharSet: set of char;
    i, res: integer;
    s: string;
  
begin
  CharSet := ['0'..'9', '+', '-', '*'];
  res := 0;
  
  s := readstring('input:');
  for i := 1 to s.length do
    res += s[i].tolower in CharSet ? 1 : 0;
  
  print('Ответ:', res);
end.