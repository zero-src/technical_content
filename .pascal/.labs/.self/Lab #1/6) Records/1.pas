type lib = record
       number : integer;
       s_name : string;
       name   : string;
     end;
     
 var student: array of lib;
     i, n, num, max, idx: integer;
     s_nm: string;
     
 function find_by_number(a: array of lib; val: integer): integer; begin
  for var i := 0 to a.Length - 1 do
    if a[i].number = val then
      result := i;
 end;
 
 procedure input(s: array of lib; n: integer); var i: integer; begin
   for i := 0 to n-1 do begin
    s[i].number := readlninteger($'{i}. UID:');
    s[i].name   := readstring($'{i}. Name:');
    s[i].s_name := readstring($'{i}. Surname:');
   end;
 end;
 
 begin
   n := readinteger('n:');
   student := new lib[n <= 0 ? 1 : n];
   
   ///Ввод данных для студентов
   input(student, n);
   
   ///Поиск по фамилии
   writeln('=' * length('Search by surname:'));
   s_nm := readlnstring('Search by surname:');
   
   for i:= 0 to student.length - 1 do
      if student[i].s_name.ToUpper = s_nm.ToUpper then begin
        println('UID:',  student[i].number);
        println('Name:', student[i].name);
        println('Surname:', student[i].s_name);
      end;
   
   ///Поиск по номеру
   writeln('=' * length('Search by UID:'));
   num := readinteger('Search by UID:');
   
   writeln('Surname: ', student[find_by_number(student, num)].s_name );
   writeln('Name: ', student[find_by_number(student, num)].name );
   
   ///Поиск по максимальному номеру
   max := student[0].number;
   idx := 0;
   
   for i := 0 to n-1 do
     if student[i].number > max then begin
       max := student[i].number;
       idx := i;
     end;
     
   ///Поиск по максимальному номеру
   writeln('=' * length('Search by max UID:'));
   writeln('Search by max UID:');
   
   writeln('UID: ', max);
   writeln('Name: ', student[idx].name );
   writeln('Surname: ', student[idx].s_name );
 end.