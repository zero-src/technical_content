const o_n = 20;
      o_m = 20;

var arr: array [1..o_n, 1..o_m] of integer;
    max, i, j, n, m: integer;

begin
  (n, m) := readinteger2('(n, m):');

  for i := 1 to n do
    for j := 1 to m do
      read(arr[i, j]);
    max:=arr[1,1];

    for j := 1 to m do begin 
        if arr[1,j] >max then 
        max:=arr[1,j];

        if arr[n, j] > max then
        max := arr[n, j];
   end;

    writeln('max: ', max, ' ');
end.