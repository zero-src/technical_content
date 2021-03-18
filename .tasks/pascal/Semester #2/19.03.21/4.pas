var c: char;
    i_f, o_f: text;

begin
  assign(i_f, 'i_file_4');
  assign(o_f, 'o_file_4');
  
  rewrite(i_f);
  while c <> 'z' do
  begin
    read(c);
    
    if c <> 'z' then
      print(i_f, c);
  end;
  close(i_f);
  
  rewrite(o_f);
  reset(i_f);
  
  print('Ответ:');
  while not SeekEof(i_f) do
  begin
    read(i_f, c);
    print(o_f, c);
    
    print(c);
  end;
  close(o_f);
  close(i_f);
end.