label 1;
const msg: array of string = (
   {0}  '+-----------+---------------------+---------------------+', { 11, 21, 21 }
   {1}  '|  возраст  |  Количество женщин  |  Количество мужчин  |', { 11, 9, 11, 9, 11}
   {2}  '|           | замужем |не замужем |  женат  |   холост  |',
   {3}  '+-----------+---------+-----------+---------+-----------+',
   {4}  '18-35лет   ',
   {5}  '35-50лет   ',
   {6}  'старше 50  ',
   {7}  'Итог:      ',
   {8}  '|'
      );

type data = record
  status : boolean := false;
  age    : integer;
  person : string;
  gender : string;
end;

var dat: array of data;
begin
  ///Defining main elements
  var n := readinteger('list size:');
  var clamp := n <= 0 ? 1 : n;
  var (stat_msg, stat_ipt) := ('', '');
  
  var wmen_m, wmen, men_m, men: array of integer;
  (wmen_m, wmen) := (new integer[5], new integer[5]);
  (men_m, men)   := (new integer[5], new integer[5]);
  
  dat := new data[clamp];
  
  ///Input
  println('-'*15);
  for var i := 0 to n-1 do
  begin
      readln; stat_msg := ''; stat_ipt := '';
      dat[i].person := readstring($'{i+1}: ФИО -');
      dat[i].gender := readstring($'{i+1}: Пол -');
      stat_msg := dat[i].gender.tolower = 'ж' ? 'Замужем?' : dat[i].gender.ToLower = 'м' ? 'Женат?' : '[~]';
      
      if stat_msg = '[~]' then
         goto 1;
      
      stat_ipt := readstring($'{i+1}: {stat_msg} -');
    1:dat[i].status := stat_ipt.tolower = 'да' ? true : stat_ipt.tolower = 'нет' ? false : false;
      dat[i].age    := readinteger($'{i+1}: Возраст -');
      println('-'*15);
  end;
  
  ///Top
  println;
  for var i := 1 to 2 do
  begin
    msg[0].println;
    msg[i].println;
  end;
  msg[3].println;
  
  ///Sorting method
  var idx := 0;
  for var i := 0 to n-1 do
  begin
    idx := dat[i].age in 18..34 ? 1 : dat[i].age in 35..50 ? 2 : dat[i].age > 50 ? 3 : 0;
    
    wmen_m[idx] += (dat[i].gender.tolower = 'ж') and dat[i].status ? 1 : 0;
    wmen[idx]   += (dat[i].gender.tolower = 'ж') and not dat[i].status ? 1 : 0;
    
    men_m[idx]  += (dat[i].gender.tolower = 'м') and dat[i].status ? 1 : 0;
    men[idx]    += (dat[i].gender.tolower = 'м') and not dat[i].status ? 1 : 0;
  end;
  
  ///Final results
  for var i := 1 to 3 do
  begin
    wmen_m[4] += wmen_m[i];
    men_m[4]  += men_m[i];
    
    wmen[4] += wmen[i];
    men[4]  += men[i];
  end;
  
  ///Drawing
  for var i := 1 to 4 do 
  begin
    writeln(msg[8], msg[i+3]:11, msg[8], wmen_m[i]:9, msg[8], wmen[i]:11, msg[8], men_m[i]:9, msg[8], men[i]:11, msg[8]);
    msg[3].println;
  end;
end.