var sum, x: integer;
    f: text;

begin
  assign(f, 'file_1');
  
  if not FileExists('file_1') then
  begin
    rewrite(f);
    for var i := 1 to 10 do
      print(f, readinteger);
    
    close(f);
  end;
  reset(f);
  
  sum := 0;
  while not SeekEof(f) do
  begin
    read(f, x);
    sum += x;
  end;
  close(f);
 
  print('Ответ:', sum);
end.