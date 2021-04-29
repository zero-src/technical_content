/// Максимальный размер списка студентов
const len = 25;

type
    /// Информация о студентах
    info = record
        surname: string;
        gender: string;
        job: string;
    end;
    
    /// Массив из записей с информацией о студентах
    data = array [1..len] of info;

var s_surname, s_gender: string;
    list_size: integer;
    d: data;

/// Визуальный разделитель текста
procedure separator;
begin
    println;
    println('='*18);
end;

/// Процедура ввода массива с информацией о студентах,
/// где d - массив со студентами, а size - количество студентов  
procedure data_input(var d: data; size: integer);
begin
    println('Information field');
    for var i := 1 to size do 
    begin
        /// Костыль для корректного ввода
        if i = 1 then
            readln;
        
        println('-'*18);
        d[i].surname := readlnstring($'{i}. Surname:');
        d[i].gender := readlnstring($'{i}. Gender:');
        d[i].job := readlnstring($'{i}. Job:');
    end;
end;
   
begin
    /// Количество студентов в списке
    list_size := readinteger('List size:');
    separator;
    
    /// Ввод данных в массив
    data_input(d, list_size);
    separator;
    
    /// Ввод фамилии для поиска работы студента
    s_surname := readlnstring('Search by surname:');
    for var i := 1 to list_size do
        if d[i].surname.ToUpper = s_surname.ToUpper then
            println('Job:', d[i].job);        
    separator;
    
    /// Поиск всех студентов заданного пола
    s_gender := readlnstring('Search by gender:');
    for var i := 1 to list_size do
        if d[i].gender.ToUpper = s_gender.ToUpper then
        begin
            println('-'*18);
            println('Surname:', d[i].surname);
            println('Job:', d[i].job);
        end;
    separator;
    
    /// Поиск первого по алфавиту студента \\\
    
    /// Сортировка студентов по алфавиту (метод пузырька)
    for var i := list_size - 1 downto 1 do
      for var j := 1 to i do
        if d[j].surname.ToUpper > d[j+1].surname.ToUpper then
            (d[j], d[j+1]) := (d[j+1], d[j]);
    
    /// Вывод данных первого студента
    println('First student by alphabet:');
    println('Surname:', d[1].surname);
    println('Gender:', d[1].gender);
    println('Job:', d[1].job);
end.