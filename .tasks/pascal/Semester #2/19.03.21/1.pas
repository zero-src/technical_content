var dec, x: integer;
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
  
  dec := 0;
  while not SeekEof(f) do
  begin
    read(f, x);
    dec += x;
  end;
  close(f);
 
  print('Ответ:', dec);
end.
