const 
    RESERVED_WORDS = [
        'and', 'array', 'as', 'auto', 'begin', 'pos',
        'case', 'class', 'const', 'constructor', 'destructor',
        'div', 'do', 'downto', 'else', 'end', 'event', 'except', 'extensionmethod',
        'file', 'finalization', 'finally', 'for', 'foreach', 'function', 'goto', 'if', 'implementation',
        'in', 'inherited', 'initialization', 'interface', 'is', 'label', 'lock', 'loop', 'mod', 'nil', 'not',
        'of', 'operator', 'or', 'procedure', 'program', 'property', 'raise', 'record', 'repeat', 'sealed', 'set',
        'sequence', 'shl', 'shr', 'sizeof', 'template', 'then', 'to', 'try', 'type', 'typeof', 'until', 'uses', 'using',
        'var', 'where', 'while', 'with', 'xor', 'abstract', 'default', 'delete', 'external', 'forward', 'internal', 'on', 'overload',
        'override', 'params', 'private', 'protected', 'public', 'read', 'readln', 'reintroduce', 'unit', 'virtual', 'write', 'writeln', 
        'print', 'println', 'end.', 'integer', 'real', 'boolean', 'string', 'readinteger', 'readreal', 'readboolean', 'readstring',
        'readlninteger', 'readlnreal', 'readlnboolean', 'readlnstring', 'readinteger2', 'readreal2', 'readboolean2', 'readstring2',
        'readlninteger2', 'readlnreal2', 'readlnboolean2', 'readlnstring2', 'readinteger3', 'readreal3', 'readboolean3', 'readstring3',
        'readlninteger3', 'readlnreal3', 'readlnboolean3', 'readlnstring3', 'randomize', 'random', 'insert', 'copy', 'length'
    ];

    SINGLE_DIGIT = [
        '(', ')',
        '[', ']',
        '=', '&', '$',
        '.', ',', '?',
        '<', '>', '^',
        ':', ';', '{', '}',
        '+', '-', '*', '//'
    ];

    MULTI_DIGIT = [
        '=', ':=', '<>', '{}',
        '+=', '-=', '*=', '/=',
        '^^', '[]', '''''', '..'
    ];

    RESERVED_SYMBOLS = SINGLE_DIGIT + MULTI_DIGIT;

    pattern: array of string = ('I', 'l');

label jump;

var is_text := 0;

function word_is_number(s: string): boolean;
begin
    var state := true;
    if (s.CountOf('-') = 1) or (s.CountOf('-') = 0) then
        if (s.CountOf('.') = 1) or (s.CountOf('.') = 0) then
            foreach var simbol in s do
                if not (simbol in ['0'..'9', '.', '-']) then
                begin
                    state := false;
                    break;
                end;
    result := state;           
end;

function is_inherited_word(s: string): boolean;
begin
    result := false;
    if (s.CountOf('.') = 1) and (not word_is_number(s)) and (s.ToLower <> 'end.') then
        result := true
end;

function is_reserved_word(s: string): boolean;
begin
    result := false;
    if (s in RESERVED_WORDS) or (s in RESERVED_SYMBOLS) or word_is_number(s) or ( (s.CountOf('''') >=2) and (s.CountOf('''') mod 2 = 0) ) then 
         result := true;
end;

function separate_word_elements(s: string): string;
begin
    var str_len := s.Length;
    var cur_letter_pos := 1;
    var cur_letter := '';
    var has_ended_text := (s.CountOf('''') + is_text) >=2;
    
    repeat
        cur_letter := s[cur_letter_pos];
        is_text += cur_letter = '''' ? 1 : 0;
        
        if (is_text = 1) and not has_ended_text then
            cur_letter_pos := str_len + 1;
        
        if is_text = 2 then
        begin
            cur_letter_pos += 1;
            
            insert(' ', s, cur_letter_pos);
            cur_letter := s[cur_letter_pos];

            is_text := 0;
        end;
        
        if (cur_letter in SINGLE_DIGIT) and not (is_text = 1) then
        begin
            if (cur_letter_pos < str_len) and ((cur_letter + s[cur_letter_pos + 1]) in MULTI_DIGIT) then
            begin
                insert(' ', s, cur_letter_pos+2);
                insert(' ', s, cur_letter_pos);
                cur_letter_pos += 3;
                continue;
            end;
            
            insert(' ', s, cur_letter_pos+1);
            insert(' ', s, cur_letter_pos);
            cur_letter_pos += 2;
        end;
        
        str_len := s.Length;
        cur_letter_pos += 1;
    until cur_letter_pos > str_len;
    
    result := s;
end;

procedure file_remove_all_comments(var inp, tmp: text);
begin
    var readed: string;
    
    inp.reset;
    tmp.rewrite;
    
    while not inp.eof do
    begin
        readln(inp, readed);

        if pos('//', readed) <> 0 then
            delete(readed, pos('//', readed), readed.Length - pos('//', readed) + 1);
        
        tmp.writeln(readed);
    end;
    
    inp.close;
    tmp.close;
    
    
    inp.rewrite;
    tmp.reset;
    while not tmp.eof do
    begin
        readln(tmp, readed);
        
        inp.writeln(readed);
    end;
    inp.close;
    tmp.close;
    tmp.erase;
end;

procedure file_space_adder(var inp, tmp: text);
begin
    inp.reset;
    tmp.rewrite;
    
    var readed := '';
    while not inp.seekeof do
    begin
        readln(inp, readed);
        
        tmp.writeln(separate_word_elements(readed));
    end;
    inp.close;
    tmp.close;
end;

procedure file_remove_useless_space(var tmp, out: text);
begin
    var readed := '';
    var cur_word := '';
    var cur_text := false;
      
    tmp.reset;
    out.rewrite;
    
    while not tmp.seekeof do
    begin
        read(tmp, readed);
        
        readed := readed.trim;
        readed += ' ';
        
        for var i := 1 to readed.Length do
        begin
            if (readed[i] in SINGLE_DIGIT) and not cur_text then
            begin
                out.write(readed[i]);
                continue;
            end;
            
            if readed[i] = '''' then
                cur_text := not cur_text;
            
            if ((readed[i] <> ' ') and not cur_text) or cur_text then
                cur_word += readed[i];
            
            if (readed[i] = ' ') and not cur_text then
            begin                
                /// is_inherited_word
                if is_inherited_word(cur_word) then
                begin
                    out.print(cur_word);
                    cur_word := '';
                    continue;
                end;
                
                /// is_reserved_word
                if is_reserved_word(cur_word.ToLower) and not (cur_word in ' '*255) then
                begin
                    if word_is_number(cur_word) then
                        out.write(cur_word)
                    else
                        out.print(cur_word);
                       
                    cur_word := '';
                    continue;
                end;
                
                if not (cur_word in ' '*255) then 
                    if readed[i+1] in SINGLE_DIGIT  then
                        out.write(cur_word)
                    else
                        out.print(cur_word); 
                
                cur_word := '';
            end;
        end;
        
        out.writeln;
        writeln;
    end;
    tmp.close;
    out.close;
    
    tmp.erase;
end;

procedure get_encrypted_word(var dict: dictionary<string, string>; var s: string);
begin
    var new_word := '';
    
    repeat
        for var i := 1 to random(5, 15) do
            new_word += pattern[random(1, 0)];
    until not dict.ContainsValue(new_word);
    
    s := new_word;
end;

procedure file_code_fucker(var dict: dictionary<string, string>; var tmp, out: text; min_word_len, max_word_len: integer);
begin
    var readed := '';
    var f_out := '';
    var cur_word := '';
    var cur_text := false;
      
    tmp.reset;
    out.rewrite;
    
    while not tmp.seekeof do
    begin
        read(tmp, readed);
        
        readed := readed.trim;
        readed += ' ';
        
        foreach var let in readed do
        begin
            if (let in SINGLE_DIGIT) and not cur_text then
            begin
                out.write(let);
                continue;
            end;
            
            if let = '''' then
                cur_text := not cur_text;
            
            cur_word += let;
            
            if (let = ' ') and not cur_text then
            begin
                cur_word := cur_word[:cur_word.Length];
                
                /// is_inherited_word
                if is_inherited_word(cur_word) and dict.ContainsKey(cur_word[:pos('.', cur_word)]) then
                begin
                    out.print(dict.Item[cur_word[:pos('.', cur_word)]] + cur_word[pos('.', cur_word):]);
                    cur_word := '';
                    continue;
                end;
                
                /// is_reserved_word
                if is_reserved_word(cur_word.ToLower) then
                begin
                    out.print(cur_word);
                    cur_word := '';
                    continue;
                end;
                
                /// WasEncripted
                if dict.ContainsKey(cur_word.ToLower) then
                begin
                    out.print(dict.Item[cur_word.ToLower]);
                    cur_word := '';
                    continue;        
                end;
                
                get_encrypted_word(dict, f_out);
                dict.Add(cur_word.ToLower, f_out);
                
                out.print(f_out);
                cur_word := '';
            end;
        end;
    end;
    tmp.close;
    out.close;
    
    tmp.rewrite;
    out.reset;
    while not out.eof do
    begin
        readln(out, readed);
        
        tmp.writeln(readed);
    end;
    tmp.close;
    out.close;
    out.erase;
end;

begin
    var file_name := readstring('FileName:');

    var inp := OpenRead(file_name + '.pas');
    var out := OpenWrite(file_name + '_unpaid.pas');
    var tmp := OpenWrite(file_name + '_tmp.pas');

    var dict := new Dictionary<string, string>;

    inp.close;
    out.close;
    tmp.close;

    ///
    /// COMMENT REMOVER
    ///

    file_remove_all_comments(inp, tmp); 

    ///
    /// SPACE ADDER
    ///

    file_space_adder(inp, tmp);

    ///
    /// CODE FUCKER
    ///

    file_code_fucker(dict, tmp, out, 5, 20);
    
    ///
    /// SPACE REMOVER
    ///
    
    file_remove_useless_space(tmp, out);
end.