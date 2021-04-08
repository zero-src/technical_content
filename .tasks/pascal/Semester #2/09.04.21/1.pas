const FileName = 'database.dat';
      sep = '-'*19;
      seh = '='*19;
      
label next;

type
    c_str = string[57];
    int = integer;
    
    address = record
        /// String types
        district: c_str;
        region: c_str;
        street: c_str;
        city: c_str;
        
        /// Integer types
        house: int;
        flat: int;
    end;
    
    fname = record
        f_name: c_str;
        s_name: c_str;
        t_name: c_str;
    end;
    
    date = record
        d: int;
        m: int;
        y: int;
    end;
    
    data_ptr = ^data;
    data = record
        /// Car information
        car_model: c_str;
        car_date: date;
        
        /// User information
        usr_address: address;
        usr_fio: fname;
        car_uid: int;
    end;
    c_file = file of data;
    
var f: c_file;
    d: data_ptr;
    search_uid: int;
    
procedure f_input(f: c_file; var field: data_ptr);
begin
    new(field);
    seek(f, FileSize(f));
    
    with field^ do
    begin    
        println('Full name');
        usr_fio.f_name := readlnstring('$name:');
        usr_fio.s_name := readlnstring('$surname:');
        usr_fio.t_name := readlnstring('$third name:');
        println(sep);
        
        println('Address');
        usr_address.region := readlnstring('$region:');
        usr_address.district := readlnstring('$district:');
        usr_address.city := readlnstring('$city:');
        usr_address.street := readlnstring('$street:');
        usr_address.house := readlninteger('$house:');
        usr_address.flat := readlninteger('$flat:');
        println(sep);
        
        println('Car information');
        car_uid := readinteger('$uid:');
        
        readln;
        car_model := readstring('$model:');
        println(sep);
        
        println('Registration date');
        car_date.d := readinteger('$day:');
        car_date.m := readinteger('$month:');
        car_date.y := readinteger('$year:');
    end;
    
    write(f, field^);
    dispose(field);
end;
    
begin    
    /// File creation
    assign(f, FileName);
    rewrite(f);
    
    /// File size
    var n := readinteger('list_size:');
    
    ////////////////////////////////////////////////////////////////
    //                    Writing to the file                     //
    ////////////////////////////////////////////////////////////////
    /// Data filling
    for var i := 1 to n do
    begin
        readln;
        println($'{#13}{seh}{#13}USER #{i}:{#13}{seh}');
        f_input(f, d);
    end;
    close(f);
    
    ////////////////////////////////////////////////////////////////
    //                  Reading from the file                     //
    ////////////////////////////////////////////////////////////////
    /// Opens file for reading
    reset(f);
    
    /// Memory allocation
    new(d);
    
    /// Reading data from filling
    while not eof(f) do
    begin
        read(f, d^);
        println(d^);
    end;
    close(f);
    
    ////////////////////////////////////////////////////////////////
    //                     Search by car UID                      //
    ////////////////////////////////////////////////////////////////
    println(seh);
    
    /// What car uid you want to find
    search_uid := readinteger('UID for search:');
    
    /// Opens file for reading
    reset(f);
    
    /// Searching
    while not eof(f) do
    begin
        read(f, d^);
        if d^.car_uid = search_uid then
        begin
          print('User info: ', d^);
          goto next;
        end;
    end;
    println('Error: user not found.');
    
    next:
    close(f);
end.