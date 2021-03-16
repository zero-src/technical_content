label OUTPUT;

type c_set = set of char; 

var str1, str2, cat: string; 
    smb: c_set;

begin
  str1 := readlnstring('string 1:');
  str2 := readlnstring('string 2:');
  
  smb := ['a'..'z', '_'];
  cat := str1 + str2;

  if not (cat[1].ToLower in smb) then
    goto OUTPUT;
  
  smb += ['0'..'9'];
  
  for var i := 2 to cat.Length do
    if not (cat[i].ToLower in smb) then
      goto OUTPUT;
    
  print('Ответ: является');
  exit;
  
  OUTPUT:
  print('Ответ: не является');
end.