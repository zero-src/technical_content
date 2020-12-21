const s_msg: array [0..2] of string = ('Search by UID:', 'Search by surname:', 'Search by max UID:');
      i_msg: array [0..2] of string = ('    UID |', '   NAME |', 'SURNAME |');
      v_msg: array [0..2] of string = ('UID:', 'Name:', 'Surname:');
      
type lib = array of string;

///Ввод данных студентов
procedure input(self: array of array of string; n: integer; params k: array of integer); begin
  for var i := 0 to n-1 do begin
    if i = 0 then readln;
    
    for var j := 0 to k.length - 1 do begin
      print($'[{i+1}] |', i_msg[k[j]]);
      readln(self[i][k[j]]);
    end;
  end;
end;

///Если строка пустая, то пишет в ней [~]
var resolved: string -> string := s -> s = '' ? '[~]' : s; 

///Преображение вывода для поиска по номеру
function addon(s: array of array of string; i: integer; flag: boolean; j: integer): string; begin
 result := flag ? $'{v_msg[i]} {s[j][i]}{#13}' : '';
end;

///Поиск студента по его номеру
procedure search_by_number(a: array of array of string; num: string; flag: boolean := false); begin
  for var i := 0 to a.length - 1 do
    if a[i][0] = num then
    println(addon(a, 0, flag, i) + $'{v_msg[1]} {resolved(a[i][1])}{#13}{v_msg[2]} {resolved(a[i][2])}');
end;

///Поиск студента по фамилии
procedure search_by_surname(a: array of array of string; sur: string); begin
  for var i:= 0 to a.length - 1 do
      if a[i][2].toupper = sur.toupper then
      println($'{v_msg[0]} {resolved(a[i][0])}{#13}{v_msg[1]} {resolved(a[i][1])}');
end;

///Разделитель (тоже для вывода)
procedure separator(x: integer; f: boolean := false); begin
  println('=' * length(s_msg[x]), f ? #13 + s_msg[x] : ' ');
end;

begin
  var n := readinteger('n:');
  
  ///Количество студентов
  var student: array of lib;
      student := new lib[n <= 0 ? 1 : n];
  
  ///Количество параметров для каждого студента
  for var i := 0 to n-1 do
    student[i] := new string[3];
   
   ///Ввод данных студента
   input(student, n, 0, 1, 2);

   ///Поиск по номеру
   separator(0);
   
   var num := readstring(s_msg[0]);
   search_by_number(student, num);
   
   ///Поиск по фамилии
   separator(1);
   
   var sur := readlnstring(s_msg[1]);
   search_by_surname(student, sur);
   
   ///Поиск по максимальному номеру    
   var max := student[0][0];
   for var i := 0 to n-1 do
     if student[i][0] > max then
       max := student[i][0];
     
   separator(2, true);
   search_by_number(student, max, true);
end.