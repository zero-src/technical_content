var range: set of integer;
    d_file, q_file: text;
    c, d, num: integer;

begin
  assign(d_file, 'file_3');
  assign(q_file, 'q3');
  
  (c, d) := readinteger2('Range [c..d]:');
  range := [c..d];
  
  rewrite(q_file);
  reset(d_file);
  
  while not SeekEof(d_file) do
  begin
    read(d_file, num);
    
    if num mod 5 = 0 then
      if num in range then
         print(q_file, num);
  end;
  
  close(q_file);
  reset(q_file);
  
  /// Numbers output
  print('Correct numbers:');
  while not SeekEof(q_file) do
  begin
    read(q_file, num);
    print(num);
  end;
  
  close(d_file);
  close(q_file);
end.