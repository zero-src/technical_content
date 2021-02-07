const c_n = 10;

type dat = record     
    day     : integer;
    month   : integer;
    year    : integer;
end;

main_data = record     
    name    : string;
    date    : dat;
    amount  : integer;
end;
m_vector = array [1..5] of real;
vec = array [1..c_n] of main_data;

var list_size, a_count: integer;
    d_count, _weight: m_vector;
    v: vec;
    
function c_str(a, b, c: integer): string;
begin
  result := a.tostring + '.' + b.tostring + '.' + c.tostring;
end;

procedure draw_default_table(size: integer; dat: vec; title: string);
const msg: array of string = (
        '+----------------------------------+-------------------+--------+', { 34, 19, 8}
        '|               ФИО                | Дата производства | кол-во |',
        '|'
      );   
begin
  /// Title + Head
  writeln(' '*(msg[0].length div 2 - title.length div 2) + title);
  println($'{msg[0]}{#13}{msg[1]}{#13}{msg[0]}');
  
  /// Body
  for var i := 0 to size-1 do
  begin
    writeln(msg[2], (i+1).ToString:3, msg[2], ' ' + dat[i+1].name + ' ' * (29 - dat[i+1].name.length), msg[2], c_str(dat[i+1].date.day, dat[i+1].date.month, dat[i+1].date.year):19, msg[2],dat[i+1].amount:8, msg[2]);
    writeln(msg[0]);
  end;
  
  writeln;
end;

procedure draw_final_table(size: integer; v: vec; title: string; cnt, wht: m_vector);
const msg: array of string = (
        '+---------+--------------------+--------------+', { 9, 20, 14}
        '| Квартал | Количество деталей | Удельный вес |',
        '|',
        '1', '2', '3', '4', 'Итог:'
      );
begin
  /// Title + Head
  writeln(' '*(msg[0].length div 2 - title.length div 2) + title);
  println($'{msg[0]}{#13}{msg[1]}{#13}{msg[0]}');
  
  /// Body
  for var i := 1 to 5 do 
  begin
    writeln(msg[2], msg[i+2] + ' ' * (9 - msg[i+2].ToString.length), msg[2], cnt[i]:20, msg[2], wht[i]:14:6, msg[2]);
    writeln(msg[0]);
  end;
end; 

begin
  list_size := readinteger('list_size:');
    
  if list_size >= 10 then
  begin
    
    /// Table filling
    for var i := 1 to list_size do
    begin
      readln;
      v[i].name := readstring($'{i}) Full name:');
      (v[i].date.day, v[i].date.month, v[i].date.year) := readinteger3($'{i}) day, month, year:');
      v[i].amount := readinteger($'{i}) Ammount:');
      println('-'*14);
    end;
    
    (*
    v[1].name        := 'Абрамов Редис Абакумович';
    v[1].date.day    := 5;
    v[1].date.month  := 9;
    v[1].date.year   := 1976;
    v[1].amount      := 1233;
    
    v[2].name        := 'Ансимова Елизавета Андреевна';
    v[2].date.day    := 21;
    v[2].date.month  := 2;
    v[2].date.year   := 2020;
    v[2].amount      := 1172;
    
    v[3].name        := 'Беляев Матвей Артёмович';
    v[3].date.day    := 11;
    v[3].date.month  := 12;
    v[3].date.year   := 2021;
    v[3].amount      := 172;
    
    v[4].name        := 'Горбушин Виталий Валерьевич';
    v[4].date.day    := 7;
    v[4].date.month  := 8;
    v[4].date.year   := 2001;
    v[4].amount      := 546;
    
    v[5].name        := 'Гриненко Алексей Алексеевич';
    v[5].date.day    := 19;
    v[5].date.month  := 10;
    v[5].date.year   := 2007;
    v[5].amount      := 3;
    
    v[6].name        := 'Грунталь Марк Альбертович';
    v[6].date.day    := 20;
    v[6].date.month  := 11;
    v[6].date.year   := 1994;
    v[6].amount      := 466;
    
    v[7].name        := 'Гурский Георгий Валентинович';
    v[7].date.day    := 5;
    v[7].date.month  := 7;
    v[7].date.year   := 2004;
    v[7].amount      := 345;
    
    v[8].name        := 'Джемгиров Очир Санджиевич';
    v[8].date.day    := 20;
    v[8].date.month  := 1;
    v[8].date.year   := 1953;
    v[8].amount      := 769;

    v[9].name        := 'Дунаев Ярослав Александрович';
    v[9].date.day    := 2;
    v[9].date.month  := 6;
    v[9].date.year   := 1912;
    v[9].amount      := 2313;
    
    v[10].name        := 'Исхаков Даниил Рамильевич';
    v[10].date.day    := 30;
    v[10].date.month  := 3;
    v[10].date.year   := 1890;
    v[10].amount      := 456;
    *)
    /// Unserted table
    draw_default_table(list_size, v, 'Unsorted Table');
    
    /// Sorting by month
    for var i := list_size-1 downto 1 do
      for var j := 1 to i do
        if v[j].date.month > v[j+1].date.month then
           (v[j], v[j+1]) := (v[j+1], v[j]);
        
    /// Sorted table
    draw_default_table(list_size, v, 'Sorted Table');
    
    /// Sorting method
    for var i := 1 to list_size do
    begin
      d_count[v[i].date.month mod 3 = 0 ? (v[i].date.month div 3) : (v[i].date.month div 3 + 1)] += v[i].amount;
      a_count += v[i].amount;
    end;     
    
    /// Final results
    for var i := 1 to 4 do
    begin
      _weight[i] := d_count[i] / a_count; 
      _weight[5] += _weight[i];
    end;
    d_count[5] := a_count;
    
    /// Final table
    draw_final_table(list_size, v, 'Final Results', d_count, _weight);
  end;
end.