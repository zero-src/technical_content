var zero: boolean;
    idx: integer;
    s, c_string: string;

begin
    /// String input
    s := readstring('строка:');
    s := s.trim;

    /// Delete spaces between words
    while pos('  ', s) > 0 do
        delete(s, pos('  ', s), 1);

    /// Начальное значение
    c_string := '';

    while pos('.', s) <> 0 do
    begin
        /// Удаление символов до точки (включительно)    
        c_string += copy(s, 1, pos('.', s));
        delete(s, 1, pos('.', s));

        /// Обновление переменных
        idx  := c_string.length;
        zero := false;

        /// Количество цифр в числе
        while (idx > 1) do
        begin
            while ((c_string[1] <> '.') and (c_string[idx] = '0')) do
            begin
                if (s[idx] = '0') and zero then
                    delete(c_string, idx, 1);
    
                zero := true;
                idx -= 1;
            end;
            
            idx -= 1;    
        end;
    end;

    c_string += s;
    println('Ответ:', c_string);
end.