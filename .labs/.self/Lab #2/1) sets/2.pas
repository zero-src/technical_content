type int = integer; 
     nums = set of int;
     
var rolls, lot: nums;
    cnt, num: int;
    
begin
  cnt := 0;
  
  while cnt < 5 do
  begin
    num := random(1, 36);
    
    if not (num in lot) then
    begin  
      lot += [num];
      cnt += 1;
    end;
  end;
  
  print('Ваши номера:');
  for var i := 1 to 5 do
    rolls += [readinteger];
  
  println('LOT:', lot);
  
  rolls *= lot;
  lot -= rolls;
  
  println('-'*18);
  println('Угаданные номера:', rolls);
  println('Неугаданные:', lot)
end.    