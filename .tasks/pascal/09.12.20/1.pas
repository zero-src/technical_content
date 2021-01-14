const i_msg: array [1..5] of string = ('Title:', 'Description:', 'Weight:', 'Charge:', 'Features:');

type data = record
  features :string;
  title: string;
  desc: string;
  
  charge: integer;
  
  weight: real;
end;

var v: array [1..118] of data;
    n, i, min: integer;
    search: string;
    max: real;

begin
  n := readinteger('n:');
  
  for i := 1 to n do begin
    if i = 1 then readln; { костыль }
    v[i].title     :=  readstring   (i_msg[1]);
    v[i].desc      :=  readstring   (i_msg[2]);
    v[i].features  :=  readstring   (i_msg[5]);
    v[i].weight    :=  readreal     (i_msg[3]);
    v[i].charge    :=  readinteger  (i_msg[4]);
  end;
  
  readln; { костыль }
  println('=' *10);
  search := readstring('Search be description:');
  for i := 1 to n do
    if v[i].desc.toupper = search.toupper then begin
      println('=' *10);
      println($'TITLE: {v[i].title}{#13}WEIGHT: {v[i].weight}{#13}CHARGE: {v[i].charge}{#13}FEATURES: {v[i].features}');
      println('=' *10);
    end;

  println('Max weight:');
  max := 0;
  
  for i := 1 to n do
    if v[i].weight > max then
      max := v[i].weight;
  println($'TITLE: {v[i].title}{#13}DESCRIPTION: {v[i].desc}{#13}CHARGE: {v[i].charge}{#13}FEATURES: {v[i].features}');
  
  println('=' *10);
  println('Min chrge:');
  min := 0;
  
  for i := 1 to n do
    if v[i].charge < min then
      min := v[i].charge;
  print($'TITLE: {v[i].title}{#13}DESCRIPTION: {v[i].desc}{#13}WEIGHT: {v[i].weight}{#13}FEATURES: {v[i].features}{#13}');
end.