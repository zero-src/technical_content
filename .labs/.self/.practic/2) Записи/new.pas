const c_n = 20;
      e_n = 2;

type dat = record     
    day     : integer;
    month   : integer;
    year    : integer;
end;

o_name = record
    f_name  : string;
    s_name  : string;
    m_name  : string;
end;

main_data = record     
    name    : o_name;
    date    : dat;
    amount  : integer;
end;

m_vector = array [1..5] of real;
vec = array [1..c_n] of main_data;

var list_size: integer;
    d_count, _weight: m_vector;
    v: vec;
    
function c_str(a, b, c: integer): string;
begin
  result := a.tostring + '.' + b.tostring + '.' + c.tostring;
end;

function n_str(a, b, c: string): string;
begin
  result := a + ' ' + b + ' ' + c;
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
    writeln(msg[2], (i+1).ToString:3, msg[2], ' ' + n_str(dat[i+1].name.f_name, dat[i+1].name.s_name, dat[i+1].name.m_name) + ' ' * (29 - n_str(dat[i+1].name.f_name, dat[i+1].name.s_name, dat[i+1].name.m_name).length), msg[2], c_str(dat[i+1].date.day, dat[i+1].date.month, dat[i+1].date.year):19, msg[2],dat[i+1].amount:8, msg[2]);
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
    
  if list_size >= e_n then
  begin
    
    /// Table filling
    println('Введите информацию:');
    println('-'*14);
    
    for var i := 1 to list_size do
    begin
      readln;
      
      println($'Данные о рабочем №{i}:');
      v[i].name.s_name := readstring('Фамилия:');
      v[i].name.f_name := readstring('Имя:');
      v[i].name.m_name := readstring('Отчество:');
      
      println;
      println($'Дата изготовления деталей рабочего №{i}:');
      v[i].date.day    := readinteger('День:');
      v[i].date.month  := readinteger('Месяц:');
      v[i].date.year   := readinteger('Год:');
      
      v[i].amount      := readinteger('Количество деталей:');
      println('-'*14);
    end;
    (*
    v[1].name.f_name := 'Абрамов';
    v[1].name.s_name := 'Редис';
    v[1].name.m_name := 'Абакумович';
    v[1].date.day    := 5;
    v[1].date.month  := 9;
    v[1].date.year   := 1976;
    v[1].amount      := 1233;
    
    v[2].name.f_name := 'Ансимова';
    v[2].name.s_name := 'Елизавета';
    v[2].name.m_name := 'Андреевна';
    v[2].date.day    := 21;
    v[2].date.month  := 2;
    v[2].date.year   := 2020;
    v[2].amount      := 1172;
    
    v[3].name.f_name := 'Беляев';
    v[3].name.s_name := 'Матвей';
    v[3].name.m_name := 'Артёмович';
    v[3].date.day    := 11;
    v[3].date.month  := 12;
    v[3].date.year   := 2021;
    v[3].amount      := 172;
    
    v[4].name.f_name := 'Горбушин';
    v[4].name.s_name := 'Виталий';
    v[4].name.m_name := 'Валерьевич';
    v[4].date.day    := 7;
    v[4].date.month  := 8;
    v[4].date.year   := 2001;
    v[4].amount      := 546;
    
    v[5].name.f_name := 'Гриненко';
    v[5].name.s_name := 'Алексей';
    v[5].name.m_name := 'Алексеевич';
    v[5].date.day    := 19;
    v[5].date.month  := 10;
    v[5].date.year   := 2007;
    v[5].amount      := 3;
    
    v[6].name.f_name := 'Грунталь';
    v[6].name.s_name := 'Марк';
    v[6].name.m_name := 'Альбертович';
    v[6].date.day    := 20;
    v[6].date.month  := 11;
    v[6].date.year   := 1994;
    v[6].amount      := 466;
    
    v[7].name.f_name := 'Гурский';
    v[7].name.s_name := 'Георгий';
    v[7].name.m_name := 'Валентинович';
    v[7].date.day    := 5;
    v[7].date.month  := 7;
    v[7].date.year   := 2004;
    v[7].amount      := 345;
    
    v[8].name.f_name := 'Джемгиров';
    v[8].name.s_name := 'Очир';
    v[8].name.m_name := 'Санджиевич';
    v[8].date.day    := 20;
    v[8].date.month  := 1;
    v[8].date.year   := 1953;
    v[8].amount      := 769;
    
    v[9].name.f_name := 'Дунаев';
    v[9].name.s_name := 'Ярослав';
    v[9].name.m_name := 'Александрович';
    v[9].date.day    := 2;
    v[9].date.month  := 6;
    v[9].date.year   := 1912;
    v[9].amount      := 2313;
    
    v[10].name.f_name := 'Исхаков';
    v[10].name.s_name := 'Даниил';
    v[10].name.m_name := 'Рамильевич';
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
      d_count[(v[i].date.month-1) div 3 + 1] += v[i].amount;
      d_count[5] += v[i].amount;
    end;     
    
    /// Final results
    for var i := 1 to 4 do
    begin
      _weight[i] := d_count[i] / d_count[5]; 
      _weight[5] += _weight[i];
    end;
    
    /// Final table
    draw_final_table(list_size, v, 'Final Results', d_count, _weight);
  end;
end.