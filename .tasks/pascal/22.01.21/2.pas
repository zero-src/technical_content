var glas, CharSet: set of char;
    s: string;
    
begin
  glas := ['а', 'о', 'и', 'е', 'ё', 'э', 'ы', 'у', 'ю', 'я'];
  CharSet := [];
  
  s := readstring('string:');
  
  if s[s.length] = '.' then
  begin
    for var i := 1 to s.length do
      CharSet += s[i].tolower in glas ? [s[i]] : [' '];
    
    for var i := 'а' to 'я' do
      if i in CharSet then
        print(i);
  end;
end.