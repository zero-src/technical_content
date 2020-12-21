var weight, price_kg, price, n: real;

begin
  write('Введите цену за 1кг: ');
  read(price_kg);

  write('Введите вес всех яблок: ');
  read(weight);
  
  price := weight * price_kg;
  write('Ответ: ', price);
end. 