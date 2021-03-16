type Chars = set of char;

var str1, str2: string;
    set1, set2: Chars;

begin
  str1 := readlnstring('string 1:');
  str2 := readlnstring('string 2:');
  
  set1 := [];
  set2 := [];
  
  for var i := 1 to str1.Length do
    set1 += [str1[i]];
  
  for var i := 1 to str2.Length do
    set2 += [str2[i]];
  
  print('Ответ:', set1 * set2);
end.