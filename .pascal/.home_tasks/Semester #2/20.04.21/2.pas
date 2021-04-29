var s: string;
    f: text;
    
begin
  assign(f, '2.txt');
  rewrite(f);
  
  s := readstring('string:');
  print(f, s);
  
  close(f);
end.