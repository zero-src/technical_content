const i_msg: array [1..4] of string = ('Name:', 'Surname:', 'Subject:', 'Mark:');

type data = record
  surname: string;
  subject: string;
  name: string;
  
  mark: integer;
end;

var s: array [1..50] of data;
    i, n: integer;
    avr: real;
    
begin
  n := readinteger('n:');
  avr := 0;
  
  for i := 1 to n do begin
   readln; { костыль }
   s[i].name     :=  readstring   (i_msg[1]);
   s[i].surname  :=  readstring   (i_msg[2]);
   s[i].subject  :=  readstring   (i_msg[3]);
   s[i].mark     :=  readinteger  (i_msg[4]);
   
   avr += s[i].mark;
  end;
  
  println('=' *17);
  println('Список отличников');
  for i := 1 to n do
    if s[i].mark = 5 then begin
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
      println($'| {s[i].surname} |' {} + $' {s[i].subject} |');
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
    end;
    
  println('Список хорошистов');
  for i := 1 to n do
    if (s[i].mark <> 3) and (s[i].mark <> 2) then begin
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
      println($'| {s[i].surname} |' {} + $' {s[i].subject} |');
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
    end;
    
  println('Список двоешников');
  for i := 1 to n do
    if s[i].mark = 2 then begin
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
      println($'| {s[i].surname} |' {} + $' {s[i].subject} |');
      println('+' + '-' * (s[i].surname.length + 2) + '+' {} + '-' * (s[i].subject.length + 2) + '+');
    end;
    
  avr := avr = 0 ? 0 : avr / n;
  writeln('Средняя оценка среди учеников: ', avr:1:2);
end.