unit o_data;

  interface
    const o_n = 10;
    
    type dat = record     
        day     : 1..31;
        month   : 1..12;
        year    : 1..2021;
    end;
    
    type main_data = record     
        name    : string;
        date    : dat;
        amount  : integer;
    end;
    
    type vec = array [1..o_n] of main_data;
    function fill_data: vec;
    
  implementation
    
    ///Заполнение данных
    function fill_data: vec;
    begin
      var v: vec;

      v[1].name        := 'Абрамов Редис Абакумович';
      v[1].date.day    := 5;
      v[1].date.month  := 9;
      v[1].date.year   := 1976;
      v[1].amount      := 1233;
      
      v[2].name        := 'Ансимова Елизавета Андреевна';
      v[2].date.day    := 21;
      v[2].date.month  := 2;
      v[2].date.year   := 2020;
      v[2].amount      := 1172;
      
      v[3].name        := 'Беляев Матвей Артёмович';
      v[3].date.day    := 11;
      v[3].date.month  := 12;
      v[3].date.year   := 2021;
      v[3].amount      := 172;
      
      v[4].name        := 'Горбушин Виталий Валерьевич';
      v[4].date.day    := 7;
      v[4].date.month  := 8;
      v[4].date.year   := 2001;
      v[4].amount      := 546;
      
      v[5].name        := 'Гриненко Алексей Алексеевич';
      v[5].date.day    := 19;
      v[5].date.month  := 10;
      v[5].date.year   := 2007;
      v[5].amount      := 3;
      
      v[6].name        := 'Грунталь Марк Альбертович';
      v[6].date.day    := 20;
      v[6].date.month  := 11;
      v[6].date.year   := 1994;
      v[6].amount      := 466;
      
      v[7].name        := 'Гурский Георгий Валентинович';
      v[7].date.day    := 5;
      v[7].date.month  := 7;
      v[7].date.year   := 2004;
      v[7].amount      := 345;
      
      v[8].name        := 'Джемгиров Очир Санджиевич';
      v[8].date.day    := 20;
      v[8].date.month  := 1;
      v[8].date.year   := 1953;
      v[8].amount      := 769;

      v[9].name        := 'Дунаев Ярослав Александрович';
      v[9].date.day    := 2;
      v[9].date.month  := 6;
      v[9].date.year   := 1912;
      v[9].amount      := 2313;
      
      v[10].name        := 'Исхаков Даниил Рамильевич';
      v[10].date.day    := 30;
      v[10].date.month  := 3;
      v[10].date.year   := 1890;
      v[10].amount      := 456;
      
      result := v;
    end;
end.