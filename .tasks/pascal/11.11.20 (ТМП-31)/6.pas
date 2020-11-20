type dat = record
      day, month, year: integer;
     end;
     
     sport = ^api;
     api = record
      sname, sort, message: string;
      dat: dat;
     end;
     
 begin
   var rec: sport;
   new(rec);
   
   rec^.sort  := readlnstring('Type:');
   rec^.sname := readlnstring('Surname:');
   
   rec^.dat.day := readinteger('Day:');
   rec^.dat.month := readinteger('Month:');
   rec^.dat.year := readinteger('Year:');
   
   rec^.message := readinteger('Message:');
   
   print(rec^);
 end.