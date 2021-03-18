const msg: array of string = (
    'ФИО Студента',
    'Количество пропущенных часов по предметам'
);

/// New features
type
    bool  = boolean;
    int   = integer;
    float = real;
    
    Arr<T> = array of T;
    custom<name, a, b, c, d, e> = (name, a, b, c, d, e);
    
var Table: array of custom<string, int, int, int, int, int>;
    
begin
    var size := readinteger('size:');
    SetLength(Table, size);
    
    Table[0] := ('Ебантяй 1',  3, 0, 3, 2, 1);
    Table[1] := ('Ебантяй 2',  1, 0, 3, 7, 0);
    Table[2] := ('Ебантяй 3',  6, 0, 3, 2, 1);
    Table[3] := ('Ебантяй 4',  0, 0, 0, 2, 0);
    Table[4] := ('Ебантяй 5',  9, 1, 3, 2, 1); 
    
    {$region secret}
    var len := Table[0][0].length;
    for var i := 1 to size-1 do
      len := len < Table[i][0].length ? Table[i][0].length : len;
    len += 2;
    
    var dig := Table[0][1].tostring.length;
    
    /// Текст по центру 
    len := len.IsEven ? len : len + 1;
    
    var sp : string -> integer := s -> trunc(((len < s.Length ? s.Length + 2 : len) / 2) - (s.Length / 2));
    var centred : (integer, string) -> string := (s, t) -> ' '*s + t + ' '*s;
    {$endregion}
    
    var f_sp := (len < msg[0].Length ? msg[0].Length + 2 : len);
    var dd := ((msg[1].Length + 2) div 5) div 2;
    
    /// Header
    println('+' + '-'*f_sp + '+' + '-'*(dd*5 * 2 + 9) + '+');
    println('|' + ' '*f_sp + '|' + centred(sp(' ' * (dd*5 * 2 + 9)) + 3, msg[1]) + '|');
    println('|' + centred(sp(msg[0]), msg[0]) + '|' + '-'*(dd*5 * 2 + 9) + '+');
    
    /// Body
    println('|' + ' '*f_sp + '|' + centred(dd, '1') + '|' + centred(dd, '2') + '|' + centred(dd, '3') + '|' + centred(dd, '4') + '|' + centred(dd, '5') + '|'); {4, 3, 3, 3, 4}
    println('+' + '-'*f_sp + '+' + '-'*(dd*5 * 2 + 9) + '+');
    
    /// Table filling
    for var i := 0 to size - 1 do
      writeln('|', ' ' + Table[i][0] + ' '*(f_sp - Table[i][0].length - 1), '|', centred(dd, Table[i][1].tostring), '|', centred(dd, Table[i][2].tostring), '|', centred(dd, Table[i][3].tostring), '|', centred(dd, Table[i][4].tostring), '|', centred(dd, Table[i][5].tostring), '|',{NEXT} #13, '+' + '-'*f_sp + '+' + '-'*(dd*5 * 2 + 9) + '+');
    
end.