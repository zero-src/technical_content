const 
    PATH = 'C:\Users\fabia\Desktop\';
    
    FILE_STRING = 'var arr: array [1..LAST] of real; write ( ''aaa'' );';

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
        ':=', '<>', '{}',
        '+=', '-=', '*=', '/=',
        '^^', '[]', '''''', '..'
    ];

    RESERVED_SYMBOLS = SINGLE_DIGIT + MULTI_DIGIT;
    PATTERN: array of string = ('I', 'l');
    
var 

    dict := new Dictionary<string, string>;
    
function encrypt_word(var key: text; o_word: string): string;
begin
    /// WasEncripted
    if dict.ContainsKey(o_word.ToLower) then
    begin
        result := dict.item[o_word.ToLower];
        exit;        
    end;
  
    var new_word := '';
    repeat
        for var i := 1 to random(5, 15) do
            new_word += PATTERN[random(1, 0)];
    until not dict.ContainsValue(new_word);
    dict.Add(o_word.tolower, new_word);
    
    key.append;
    key.println('key', new_word, ' '*(20 - ('key '+new_word).length), 'val', o_word.tolower);
    key.close;
    
    result := new_word;
end;

function decrypt_word(var key: text; o_word: string): string;
begin
    key.reset;
    var words := key.ReadlnString.ToWords;
    key.close;

    result := words[3];
end;

function separate_words(s: string): string;
begin
    
end;

begin    
    var file_name := readstring('FileName:');
    
    var inp := OpenRead(PATH + file_name + '.pas'); inp.close;
    var out := OpenWrite(PATH + file_name + '_unpaid.pas'); out.close;
    var key := OpenWrite(PATH + file_name + '_key.txt'); key.close;

    var RESERVED_WORDS := '';
    foreach var args in RESERVED_WORDS_SEQ do
        RESERVED_WORDS += args;
    
    inp.reset;
    out.rewrite;
    while not inp.seekeof do
    begin
        var file_text := inp.ReadlnString;
        file_text := separate_words(file_text);
        
        var new_pattern := '';
        foreach var s in file_text.ToWords do
            new_pattern += (s in RESERVED_SYMBOLS) or s.IsMatch(RESERVED_WORDS) or s.IsMatch('\b\d+') ? s + ' ' : encrypt_word(key, s) + ' ';
        
        println(new_pattern);
        out.println(new_pattern);
    end;
    out.close;
    inp.close;
end.
    