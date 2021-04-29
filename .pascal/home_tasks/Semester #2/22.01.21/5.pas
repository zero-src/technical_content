const LetterSets: array of set of 'а'..'я' = (
{глас}  ['а', 'о', 'и', 'е', 'ё', 'э', 'ы', 'у', 'ю', 'я'],
{звон}  ['б', 'в', 'г', 'д', 'ж', 'з', 'л', 'м', 'н', 'р'],
{глух}  ['к', 'п', 'с', 'т', 'ф', 'х', 'ц', 'ч', 'ш', 'щ'],
        ['й', 'ь', 'ъ']
      );
      
type lib = set of 'а'..'я';

procedure output(a: lib);
begin
  for var i := 'а' to 'я' do
    if i in a then
      print(i);
  println;
end;

var a_CharSet, o_CharSet, EvenCharSet, OddCharSet: array of lib;
    flag, even, clear: boolean;
    i, idx: integer;
    s: string;
    
begin
  ///For each option
  (EvenCharSet, OddCharSet) := (new lib[2], new lib[2]);
  (a_CharSet, o_CharSet) := (new lib[10], new lib[10]);
  
  
  ///Filling sets
  for i := 0 to 9 do begin
    if i < 2 then begin
       EvenCharSet[i] := [];
       OddCharSet[i]  := [];
    end;
    
    a_CharSet[i] := [];
    o_CharSet[i] := [];
  end;
  
  ///String input
  s := readstring('string:');
  clear := true;
  
  for i := 1 to s.length do
    if clear then
       clear := s[i] in 'а'..'я' ? true : false;
  
  if not clear then begin
     print('Error: not all letters exists in russian alphabet.');
     exit;
  end;
  
  ///Check for ["."]
  if s[s.length] = '.' then
  begin
    
    ///
    ///Letter ["a"]
    ///
    print('а)');
    idx := 0;

    flag := false;
    for i := 1 to s.length do
      if s[i] in LetterSets[0] then
        include(a_CharSet[0], s[i])
      else 
        if ((s[i] = ',') or (s[i] = '.')) and (not flag) then begin
          o_CharSet[idx] := a_CharSet[idx];
          a_CharSet[idx] := [];
          flag := true;
        end
          else
            if ((s[i] = ',') or (s[i] = '.')) and flag then begin
              o_CharSet[idx] *= a_CharSet[idx];
              a_CharSet[idx] := [];
            end;
            
    output(o_CharSet[idx]);
     
    ///
    ///Letter ["б"]
    ///
    print('б)');
    idx += 1;
    
    o_CharSet[idx] := ['а'..'я'];
    o_CharSet[idx] -= LetterSets[0];
    o_CharSet[idx] -= LetterSets[3];

    for i := 1 to s.length do
      if s[i] in (['а'..'я'] - LetterSets[0] - LetterSets[3]) then
         include(a_CharSet[idx], s[i]);
     
    o_CharSet[idx] -= a_CharSet[idx];
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["в"]
    ///
    print('в)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[1] then
         include(a_CharSet[idx], s[i]);
     
    output(a_CharSet[idx]);
    
    ///
    ///Letter ["г"]
    ///
    print('г)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[2] then
        include(a_CharSet[idx], s[i])
      else
        if (s[i] = ',') or (s[i] = '.') then begin
            o_CharSet[idx] += o_CharSet[idx] = [] ? a_CharSet[idx] : LetterSets[2] - a_CharSet[idx];
        end;
    
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["д"]
    ///
    print('д)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in (['а'..'я'] - LetterSets[0] - LetterSets[3]) then
         include(a_CharSet[idx], s[i])
      else 
        if (s[i] = ',') or (s[i] = '.') then begin
          o_CharSet[idx] := o_CharSet[idx] < a_CharSet[idx] ? a_CharSet[idx] : o_CharSet[idx];
          a_CharSet[idx] := [];
        end;
            
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["е"]
    ///
    print('е)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[2] then
         include(a_CharSet[idx], s[i])
      else 
        if (s[i] = ',') or (s[i] = '.') then begin
          o_CharSet[idx] := o_CharSet[idx] < a_CharSet[idx] ? a_CharSet[idx] : o_CharSet[idx];
          a_CharSet[idx] := [];
        end;
            
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["ж"]
    ///
    print('ж)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[1] then
        if not (s[i] in a_CharSet[idx]) then
            a_CharSet[idx] += [s[i]]
        else
            o_CharSet[idx] += [s[i]];
        
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["з"]
    ///
    print('з)');
    idx += 1;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[0] then
        if not (s[i] in a_CharSet[idx]) then
            a_CharSet[idx] += [s[i]]
        else
            o_CharSet[idx] += [s[i]];
        
    output(LetterSets[0] - o_CharSet[idx]);
    
    ///
    ///Letter ["и"]
    ///
    print('и)');
    idx += 1;
    
    flag := false;
    even := false;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[1] then
        include(a_CharSet[idx], s[i])
      else 
        if ((s[i] = ',') or (s[i] = '.')) and (not flag) then begin
           OddCharSet[0]  := a_CharSet[idx];
           EvenCharSet[0] := LetterSets[1] - OddCharSet[0];
           
           o_CharSet[idx] := OddCharSet[0];
           a_CharSet[idx] := [];
          
          flag := true;
          even := not even;
        end
          else
            if ((s[i] = ',') or (s[i] = '.')) and flag then begin
              if even then begin
                o_CharSet[idx] -= a_CharSet[idx];
                a_CharSet[idx] := [];
              end
                else begin
                  o_CharSet[idx] -= EvenCharSet[0];
                  a_CharSet[idx] := [];
                end;
              
              even := not even;
            end;
        
    output(o_CharSet[idx]);
    
    ///
    ///Letter ["к"]
    ///
    print('к)');
    idx += 1;
    
    flag := false;
    even := false;
    
    for i := 1 to s.length do
      if s[i] in LetterSets[2] then
        include(a_CharSet[idx], s[i])
      else 
        if ((s[i] = ',') or (s[i] = '.')) and (not flag) then begin
           OddCharSet[1]  := a_CharSet[idx];
           EvenCharSet[1] := LetterSets[2] - OddCharSet[1];
           
           o_CharSet[idx] := OddCharSet[1];
           a_CharSet[idx] := [];
          
          flag := true;
          even := not even;
        end
          else
            if ((s[i] = ',') or (s[i] = '.')) and flag then begin
              if even then begin
                o_CharSet[idx] -= OddCharSet[1] * EvenCharSet[1] = [] ? a_CharSet[idx] : [' '];
                a_CharSet[idx] := [];
              end
                else begin
                  o_CharSet[idx] -= EvenCharSet[1];
                  a_CharSet[idx] := [];
                end;
              
              even := not even;
            end;
        
    output(o_CharSet[idx]);
  end
    else
      write($'Error: ["."] was not founnd.{#13}Last founded symbol is: {s[s.length]}');
end.