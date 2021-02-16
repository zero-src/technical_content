const 
  m_table: array [1..3] of string = (
      '+----------+--------------+--------------+', {10, 14, 14}
      '|  Группа  | Успеваемость | Посещаемость |',
      '+----------+--------------+--------------+'
  );
  
  table: array [1..3] of string = (
      '+----------+------------------+--------------+--------------+', {10, 18, 14, 14}
      '|  Группа  | Кол-во студентов | Успеваемость | Посещаемость |',
      '+----------+------------------+--------------+--------------+'
  );
  
  a_max = 20;
  limit = 10;

type data = record
  /// Integer
  count      : integer;
  
  /// Real
  attendance : real;
  progress   : real;
  
  /// String
  header     : string; 
end;
vec = array [1..a_max] of data;

var size, k, idx: integer;
    same: set of integer; 
    used: set of real;
    max: real;
    g: vec;
    
procedure o_table(g: vec; size: integer);
begin
  for var i := 1 to size+3 do
    writeln(i <= 3 ? table[i] : '|' + g[i-3].header + ' '*(10 - g[i-3].header.length) + '|' + (g[i-3].count:18).tostring + '|' + (g[i-3].progress:14).tostring + '|' + (g[i-3].attendance:14).tostring + '|');
  writeln(table[1]);
end;

begin
  used := [];
  same := [];
  
  idx := 0;
  max := 0;
  k := 1;
  
  while size < limit do
    size := readinteger('Размер списка:');
  
  for var  i := 1 to size do
  begin
    readln;
    g[i].header     := readstring($'{i}. Группа:');
    g[i].count      := readinteger($'{i}. Количество студентов:');
    g[i].progress   := readinteger($'{i}. Успеваемость:');
    g[i].attendance := readinteger($'{i}. Посещаемость:');
    writeln('-'*15);
  end;
  
  {$region datatable}
  (*
    g[1].header     := 'ТМП-25';
    g[1].count      := 25;
    g[1].progress   := 73;
    g[1].attendance := 56;
    
    g[2].header     := 'ТМП-41';
    g[2].count      := 20;
    g[2].progress   := 69;
    g[2].attendance := 78;
    
    g[3].header     := 'ТМП-72';
    g[3].count      := 17;
    g[3].progress   := 38;
    g[3].attendance := 68;
    
    g[4].header     := 'ТМП-71';
    g[4].count      := 24;
    g[4].progress   := 69;
    g[4].attendance := 44;
    
    g[5].header     := 'ТМП-61';
    g[5].count      := 27;
    g[5].progress   := 67;
    g[5].attendance := 45;
    
    g[6].header     := 'ТМП-62';
    g[6].count      := 23;
    g[6].progress   := 64;
    g[6].attendance := 84;
  *)
  {$endregion} {6}
  
  /// Default table
  o_table(g, size);
  writeln;
  
  /// Sorted table
  for var i := size-1 downto 1 do
    for var j := 1 to i do
      if g[j].progress < g[j+1].progress then
        (g[j], g[j+1]) := (g[j+1], g[j]);
  
  o_table(g, size);
  writeln;
  
  /// Best groups
  for var i := 1 to 3 do
    writeln(m_table[i]);
  
  /// While table size is less then (size / 2)
  var i := 1;
  while k <= trunc(size div 2) do
  begin
    /// Compare with
    if not (g[i].progress in used) then
      for var j := i+1 to size do
        if g[i].progress = g[j].progress then
        begin
          
          /// Max index
          if max < g[j-1].attendance then
          begin
            max := g[j-1].attendance;
            idx := j-1;
          end;
          
          /// Set with same progress
          used += [g[j].progress];
          same += [j];
        end;
    
    /// Unic elements
    if idx = 0 then
      if not (i in same) then
      begin
        writeln('|' + g[i].header + ' '*(10 - g[i].header.length) + '|' + (g[i].progress:14).tostring + '|' + (g[i].attendance:14).tostring + '|');
        k += 1;
      end;
      
    /// Same elements
    if g[i].progress in used then
      if g[i].attendance = max then
      begin
        writeln('|' + g[idx].header + ' '*(10 - g[idx].header.length) + '|' + (g[idx].progress:14).tostring + '|' + (g[idx].attendance:14).tostring + '|');
        k += 1;
      end;
    
    /// Elements update
    idx := 0;
    i += 1;
  end;
  
  writeln(m_table[1]);
end.