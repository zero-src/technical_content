unit math;

interface
const PI  = 3.14159265359;

function c_length(r: real): real;
function c_square(r: real): real;

implementation

function c_length := 2 * PI * r;
function c_square := PI * r * r;

end.