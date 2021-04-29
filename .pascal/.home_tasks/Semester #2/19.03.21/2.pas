var x: integer;
    f: text;

begin
  assign(f, 'file_2');
  rewrite(f);    
  
  while x <> 999 do
  begin
    read(x);
    
    if x <> 999 then
      print(f, x);
  end;
  
  close(f);
  reset(f);
  
  while not SeekEof(f) do
  begin
    read(f, x);
    print(x);
  end;
  
  close(f);
end.