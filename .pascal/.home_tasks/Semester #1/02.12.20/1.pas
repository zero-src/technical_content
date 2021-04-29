type systema = ^api;
     api = record
      num: integer;
      name: string;
      dist: real;
      v: real;
      d: real;
     end;
     
 begin
   var planeta: systema;
   new(planeta);
   
   planeta^.num  := readlninteger('Number:');
   planeta^.name := readlnstring('Name:');
   planeta^.v    := readlnreal('V:');
   planeta^.d    := readlnreal('D:');
   planeta^.dist := readlnreal('Dist:');
   
   print(planeta^);
 end.