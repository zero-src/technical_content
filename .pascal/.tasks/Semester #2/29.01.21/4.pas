uses system;

const msg: array of string = (
        'About program: power alternative',
        'Registered to:',
        'Build date:'
      );
      s_date = System.DateTime.Now;

procedure __message;
begin
  println('-' * msg[0].length);
  
  println(msg[0]);
  println(msg[1], Environment.UserName);
  println(msg[2], $'{s_date.month}/{s_date.day}/{s_date.year}');
  
  println('-' * msg[2].length);
  
  println($'a = 2, b = 3;{#13}pow(a, b) = a^b;{#13}pow(2, 3) = 8;');
  
  println('-' * msg[0].length);
end;

function pow(a, b: real): real := exp(ln(a) * b);
var a, b: real; 
  
begin
  ///Watermark
  __message;
  
  ///Input for variables
  (a, b) := readreal2('a, b:');
  
  ///Results
  print('Ответ:', pow(a, b));
end.