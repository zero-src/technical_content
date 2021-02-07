uses o_data;

/// Date to string
function s_date(a, b, c: integer): string := a.tostring + '.' + b.tostring + '.' + c.tostring;

/// Drawing table
procedure draw_default_table(n: integer; var input: o_data.vec; title: string; sort: boolean := false);
  const msg: array of string = (
          '+----------------------------------+-------------------+--------+', { 34, 19, 8}
          '|               ФИО                | Дата производства | кол-во |',
          '|'
        );   
begin
  ///Sorting
  if sort then
    for var i := n-1 downto 1 do
      for var j := 1 to i do
        if input[j].Date.month > input[j+1].Date.month then
           (input[j], input[j+1]) := (input[j+1], input[j]);    

  /// Title 
  writeln(' '*(msg[0].length div 2 - title.length div 2) + title);
  
  /// Head
  println($'{msg[0]}{#13}{msg[1]}{#13}{msg[0]}');
  
  /// Body
  for var i := 0 to n-1 do
  begin
    writeln(msg[2], (i+1).ToString:3, msg[2], ' ' + input[i+1].name + ' ' * (29 - input[i+1].name.length), msg[2], s_date(input[i+1].date.day, input[i+1].date.month, input[i+1].date.year):19, msg[2],input[i+1].amount:8, msg[2]);
    writeln(msg[0]);
  end;
end;

/// Drawing table
procedure draw_main_table(n: integer; input: o_data.vec; title: string);
  const msg: array of string = (
          '+---------+--------------------+--------------+', { 9, 20, 14}
          '| Квартал | Количество деталей | Удельный вес |',
          '|',
          '1', '2', '3', '4', 'Итог:'
        );
  var a_cnt := 0.0;
begin
  /// Arrays
  var (_weight, d_count, w_count) := (new real[6], new integer[6], new real[6]);
  
  /// Sorting method
  var idx := 0;
  for var i := 1 to n do
  begin
    idx := input[i].date.month in 1..3 ? 1 : input[i].date.month in 4..6 ? 2 : input[i].date.month in 7..9 ? 3 : input[i].date.month in 10..12 ? 4 : 0;
    
    d_count[idx] += input[i].amount;
    _weight[idx] += 1;
    w_count[idx] += 1;
  end;
  
  /// Weight
  for var i := 1 to 4 do
     w_count[5] += w_count[i];
   
  
  /// Final results
  for var i := 1 to 4 do
  begin
    d_count[5] += d_count[i];
    _weight[i] := w_count[i] / w_count[5];
    
    _weight[5] += _weight[i];
  end;
  
  /// Title 
  writeln(' '*(msg[0].length div 2 - title.length div 2) + title);
  
  /// Head
  println($'{msg[0]}{#13}{msg[1]}{#13}{msg[0]}');
  
  /// Body
  for var i := 1 to 5 do 
  begin
    writeln(msg[2], msg[i+2] + ' ' * (9 - msg[i+2].ToString.length), msg[2], d_count[i]:20, msg[2], _weight[i]:14, msg[2]);
    writeln(msg[0]);
  end;
end;

begin
  var list_size := readinteger('list_size:');
  var input := fill_data; 
    
  if (list_size >= 10) and (list_size <= o_data.o_n) then
  begin
    /// rendering table w/o changes
    draw_default_table(list_size, input, 'Unsorted table');
    
    /// rendering sorted table
    draw_default_table(list_size, input, 'Sorted table', true);
    
    /// rendering main table
    draw_main_table(list_size, input, 'Main table');
  end
  else
    if list_size < 10 then
       print('Error: list_size меньше 10.')
    else
      if list_size > o_data.o_n then
        print('Error: list_size больше, чем размер базы данных.');
end.