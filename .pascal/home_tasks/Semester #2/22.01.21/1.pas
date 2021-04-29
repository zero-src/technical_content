var a_CharSet, b_CharSet, c_CharSet: set of char;
    i, j: byte;
    s: string;
    
begin
  (a_CharSet, b_CharSet, c_CharSet) := ([], [], []);
  
  s := readstring('string:');
  
  if s[s.length] = '.' then
  begin
    print('а)');
    for i:=1 to s.length do
      if s[i].tolower in ['a'..'z'] then
        if not (s[i] in a_CharSet) then
        begin
          print(s[i]); 
          a_CharSet += [s[i]];
        end;
    
    println;
    print('б)');
    for i:=1 to s.length do
      if (s[i].tolower in ['a'..'z']) then
      begin
        if not (s[i] in b_CharSet) then
          b_CharSet += [s[i]]
        else
          print(s[i]); 
      end;
    
    println;
    print('в)');
    for i := 1 to s.length do
      if (s[i].tolower in ['a'..'z']) then
      begin
        if not (s[i] in c_CharSet) then
          c_CharSet += [s[i]]
        else
          c_CharSet -= [s[i]];
       end;
     
     foreach var x in c_CharSet do
       print(x);
  end;
end.