const msg: array of string = (
        '+-----------------+---------------------+--------+', {17, 21, 8}
        '|    Кинотеатр    |        Фильм        | Кол-во |',
        '|'
);
      c_n = 20;
      e_n = 3;

type data = record
    s_count : integer;
    advert  : string;
    title   : string;
end;

vec = array [1..c_n] of data;
arr = array of string;

var m_count, max: array of integer;
    category: set of string;
    cnt, list_size: integer;
    table, film: arr;
    t_count: real;
    v: vec;
    
function search(a: arr; item: string): integer;
begin
  for var i := 0 to a.length - 1 do
    if a[i] = item then
      result := i;
end;

procedure draw_table(size: integer; v: vec);
begin
  writeln(msg[0], #13, msg[1], #13, msg[0]);
  
  for var i := 1 to size do
  begin
    writeln(msg[2], v[i].advert + ' '*(17-v[i].advert.Length), msg[2], v[i].title:21, msg[2], v[i].s_count:8, msg[2]);
    writeln(msg[0]);
  end;
  
  writeln;
end;

procedure draw_final_table(size: integer; table, film: arr; m_count: array of integer; t_count: real);
begin
  writeln(msg[0], #13, msg[1], #13, msg[0]);
  
  for var i := 1 to size do
  begin
    writeln(msg[2], table[i-1] + ' '*(17 - table[i-1].Length), msg[2], film[i-1]:21, msg[2], m_count[i-1]:8, msg[2]);
    writeln(msg[0]);        
  end;
  
  writeln(msg[2], 'Итог: ' + ' ' * (39 - 'Итог: '.Length), msg[2], t_count:8, msg[2]);
  writeln(msg[0]);
  writeln;
end;

begin
  list_size := readinteger('list_size:');
  category := [];

  v[1].advert  := 'Каро';
  v[1].title   := 'Тор4и';
  v[1].s_count := 228;
  
  v[2].advert  := 'Спектор';
  v[2].title   := 'Голяк';
  v[2].s_count := 156;
  
  v[3].advert  := 'Каро';
  v[3].title   := 'Чёрный Иисус';
  v[3].s_count := 246;
  
  /// Unsorted table
  draw_table(list_size, v);
  
  /// Sorted table
  for var i := list_size-1 downto 1 do
    for var j := 1 to i do
      if v[j].title > v[j+1].title then
      (v[j], v[j+1]) := (v[j+1], v[j]);
      
  draw_table(list_size, v);
  
  /// Final table
  for var i := 1 to list_size do
  begin
    if not (v[i].advert in category) then
    begin
      category += [v[i].advert];
      cnt += 1;
    end;
  end;
  
  m_count := new integer[cnt];
  table   := new string[cnt];
  film    := new string[cnt];
  max     := new integer[cnt];
  
  var idx := 0;
  
  foreach var x in category do
  begin
    table[idx] := x;
    idx += 1;
  end;
  
  for var i := 1 to list_size do
  begin
    if v[i].advert = table[search(table, v[i].advert)] then 
       m_count[search(table, v[i].advert)] := max[search(table, v[i].advert)] > v[i].s_count ? max[search(table, v[i].advert)] : v[i].s_count;
    
    if v[i].advert = table[search(table, v[i].advert)] then
       film[search(table, v[i].advert)] :=  v[i].title;
  end;
  
  for var i := 1 to cnt do
    t_count += m_count[i-1];
  t_count /= cnt;
  
  draw_final_table(cnt, table, film, m_count, t_count);
end.