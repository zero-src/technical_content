var x, y, z, sum, min: real;

begin
  write('Введите x, y, z: ');
  read(x, y, z);
  
  sum := x + y + z;
  ///Проверка на попарную различность
  if (x <> y) and (y <> z) then begin
    ///Меньше ли сумма чем 1
    if sum < 1 then begin
      ///Приравниваем меньшему числу полусумму двух других
      min := x;
      if y < min then 
         min := y;
      else
        min := z;
      
      
      
      if (x < y) and (x < z) then {начало}
        x := (y + z) / 2
      else 
        if (y < x) and (y < z) then
          y := (x + z) / 2
        else
          z := (x + y) / 2; {конец}
    end
      else {если сумма больше чем 1, приравниваем меньшему из (x y) полусуму двух других чисел}
        if (x < y) then
          x := (y + z) / 2
        else 
          y := (x + z) / 2;
  end;
  
  writeln('Ответ: ', x, ' ', y, ' ', z);    
end.