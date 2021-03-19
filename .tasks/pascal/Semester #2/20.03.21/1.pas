var num: real; 
    f: text;
    
begin
  /// File init
  assign(f, 'file_1');
  rewrite(f);
  
  /// Filling cur file
  print('Write 5 numbers:');
  for var i := 1 to 5 do
    print(f, readreal);
  
  /// Closing cur file
  close(f);
  
  /// Open file for reading
  reset(f);
  
  /// Numbers output
  print('Current numbers:');
  for var i := 1 to 5 do
  begin
    read(f, num);
    print(num);
  end;
  println;
  
  /// Closing cur file
  close(f);
  
  /// Open file for writing
  append(f);
  
  /// Adding new numbers
  print('Additional numbers:');
  while num <> 999 do
  begin
    read(num);
    
    if num <> 999 then
      print(f, num);
  end;
  
  /// Closing cur file
  close(f);
  
  /// Open file for reading
  reset(f);
  
  /// Numbers output
  print('All numbers:');
  while not SeekEof(f) do
  begin
    read(f, num);
    print(num);
  end;
end.