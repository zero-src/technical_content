var f, tmp: file of integer;
    num, count: integer;

begin
  assign(f, '3.txt');
  assign(tmp, '3t.txt');
  
  count := readinteger('num cnt:');
  
  rewrite(f);
  for var i := 1 to count do
  begin
    seek(f, FileSize(f));
    write(f, readinteger);
  end;
  close(f);
  
  rewrite(tmp);
  reset(f);
  while not eof(f) do
  begin
    read(f, num);

    write(tmp, num*2);
  end;
  close(tmp);
  close(f);
  
  rewrite(f);
  reset(tmp);
  while not eof(tmp) do
  begin
    read(tmp, num);
    
    write(f, num);
  end;
  close(tmp);
  close(f);
end.