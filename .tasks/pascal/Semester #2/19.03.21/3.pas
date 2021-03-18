var IsInFile: boolean = false;
    x, inp: integer;
    f: text;

begin
  assign(f, 'file_3');
  
  if not FileExists('file_3') then
  begin
    rewrite(f);
    for var i := 1 to 10 do
      print(f, readinteger);
    
    close(f);
  end;
  reset(f);
  
  inp := readinteger('number:');
  while not SeekEof(f) do
  begin
    read(f, x);
    
    if x = inp then
       IsInFile := true;
  end;
  close(f);
 
  print('Ответ:', IsInFile);
end.