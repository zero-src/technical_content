const msg: array of string = (
        '+----------------------------------+-----+----------+', { 34, 5, 10}
        '|               ФИО                | пол |  статус  |',
        '|'
      ); 

type data = record
  person : string;
  gender : string;
  status : string;
end;

var dat: array of data;
begin
  ///Defining main elements
  var (stat_msg, stat_ipt) := ('', '');
  var n := readinteger('list size:');
  dat := new data[n <= 0 ? 1 : n];
  
  ///Input
  println('-'*15);
  for var i := 0 to n-1 do
  begin
    if i = 0 then readln;
      dat[i].person := readstring($'{i+1}: ФИО -');
      dat[i].gender := readstring($'{i+1}: Пол -');
      
      stat_msg := dat[i].gender.tolower = 'ж' ? 'Замужем?' : dat[i].gender.ToLower = 'м' ? 'Женат?' : '[~]';
      stat_ipt := readstring($'{i+1}: {stat_msg} -');
      dat[i].status := (stat_ipt.tolower = 'да') and (dat[i].gender.tolower = 'ж') ? 'замужем' : (stat_ipt.tolower = 'нет') and (dat[i].gender.tolower = 'ж') ? 'не замужем' :
                       (stat_ipt.tolower = 'да') and (dat[i].gender.tolower = 'м') ? 'женат'   : (stat_ipt.tolower = 'нет') and (dat[i].gender.tolower = 'м') ? 'холост' : '~';
                       
      println('-'*15);
  end;
  
  ///Top
  println;
  msg[0].println;
  msg[1].println;
  msg[0].println;
  
  ///Drawing
  for var i := 0 to n-1 do
  begin
    writeln(msg[2], (i+1).ToString:3, msg[2], dat[i].person:30, msg[2], dat[i].gender:5, msg[2], dat[i].status:10, msg[2]);
    msg[0].println;
  end;
end.