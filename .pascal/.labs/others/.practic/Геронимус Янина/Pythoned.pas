///
const
  BAUTH = 1;
  BNAME = 2;
  BYEAR = 3;
  maxauthor = 11;
  authors = 12;

var
  i, r, x: Byte;
  Book: array[1..11, 1..3] of String;
  B: array[1..3] of String;
  Author: array[1..authors, 1..3] of String;
  curAuthor: String;
  curAll, cur2005: Word;


procedure ShowBookShelf(mes: String);
var
  bb: Byte;
begin
  
  WriteLn();
  
  WriteLn('-----------------------------');
  WriteLn(' BOOKS' + mes);
  WriteLn('-----------------------------');
  for bb := 1 to 10 do
  begin
    WriteLn(Book[bb, BYEAR], ') ', Book[bb, BNAME], ' - ', Book[bb, BAUTH]);
  end;
end;



function GetWriter(): String;
var
  r: Byte;
  buf: String;
begin
  
  r := random(6);
  case r of
    0: buf := 'Геонимус Янина ';
    1: buf := 'Лиманр Зоя';
    2: buf := 'Думчев Алексей';
    3: buf := 'Полеев Вадим';
    4: buf := 'Добрякова Вероника';
    5: buf := 'Андреева Елизавета ';
    6: buf := 'Занько Михайл';
    7: buf := 'Радомский Илья';
    8: buf := 'Платонов Роман';
    9: buf := 'Герасимов Дмитрий ';
    10: buf := 'Соктоев Бато';
    11: buf := 'Катюшина В.А. ';
  
  
  else buf := 'Автор Неизвестен';
  
  end; 
  
  GetWriter := buf;
  
end;

begin
  for i := 1 to 10 do
  begin
    Book[i, BAUTH] := GetWriter();
    Book[i, BNAME] := 'ХОРРОР:ПРАКТИКА';
    Book[i, BYEAR] := IntToStr( 1960 + Random(61));
    
  end;
  
  Book[10, BAUTH] := 'АAфанасий Аристархов';
  Book[1, BAUTH] := 'ЯЯрослав Шевцов';
 
  ShowBookShelf('');
  for r := 1 to 9 do
  begin
    for i := 2 to 10 do
    begin
      if (Book[i, BAUTH] < Book[i - 1, BAUTH]) then 
      begin
        B[BAUTH] := Book[i - 1, BAUTH];
        B[BNAME] := Book[i - 1, BNAME];
        B[BYEAR] := Book[i - 1, BYEAR];
        
        Book[i - 1, BAUTH] := Book[i, BAUTH];
        Book[i - 1, BNAME] := Book[i, BNAME];
        Book[i - 1, BYEAR] := Book[i, BYEAR];
        
        Book[i, BYEAR] := B[BYEAR];
        Book[i, BNAME] := B[BNAME];
        Book[i, BAUTH] := B[BAUTH];
      end;
    end;
  end; 
  
  ShowBookShelf('Finally');

  x := 1;
  curAuthor := Book[1, BAUTH];
  curAll := 0;
  cur2005 := 0;
  Book[11, BAUTH] := '-------------';
  Book[11, BYEAR] := '0001';
  
  for i := 1 to 11 do
  begin
    if (curAuthor <> Book[i, BAUTH]) then 
    begin
      Author[x, 1] := curAuthor;
      Author[x, 2] := IntToStr(curAll);
      Author[x, 3] := IntToStr(cur2005);
      SetLength( Author[i, 1], 25);
      SetLength( Author[i, 2], 6);
      SetLength( Author[i, 3], 6);
      Inc(x);
      
      curAll := 1;
      cur2005 := 0;
      
      if (StrToInt(Book[i, BYEAR]) > 2005) then 
        Inc(cur2005);
      
      curAuthor := Book[i, BAUTH];
    end 
    else 
      begin
        Inc(curAll);
        if (StrToInt(Book[i, BYEAR]) > 2005) then 
          Inc(cur2005);
      end; 
  end; 
  
  WriteLn('VSEG|posle 2005 | FIO                          |');
  for i := 1 to x - 1  do
    WriteLn(Author[i, 2]:4, '|', Author[i, 3]:11, '|', Author[i, 1]:30, '|');
end.