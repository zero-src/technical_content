type a = set of char;

var rus, lat: a;
    c: char;

begin
  rus := ['а'..'я'];
  lat := ['a'..'z'];
  
  repeat
    c := readlnchar('Введите букву:');
    
    if c.tolower <> 'z' then
    begin
      if c.tolower in rus then
         println('Она русская')
      else
        if c.tolower in lat then
           println('Она латинская')
        else
           println('Это не буква');
    end;
    
  println('-'*10);
  until c = 'z';
end.