  
unit math;

interface
const PI  = 3.14159265359;

function t_perimeter(a, b, c: real): real;
function t_square(a, b: real): real;

implementation

function t_perimeter := a + b + c;
function t_square := (a * b) / 2;
end.