{ Any unauthorised broadcasting, public performance, copying or re-recording will constitute an infringement of copyright. }
uses FormsABC;

const form = MainForm;
      size = form.SetSize;
      centred = form.CenterOnScreen;
      msg: array [0..4] of string = (
        'Калькулятор',
        'Первое число:', 
        'Второе число:',
        'Операция',
        'Вычисление'
      ); 
      
///Defining variables
var first_number, second_number: realfield;
    v_operator: combobox;
    v_button: button;
    box: textbox;
    
///on_click function
function calc(a, b: real; idx: integer): real; begin
  case idx of
    0: result := a + b;
    1: result := a - b;
    2: result := a * b;
    3: result := a / b
  else
    result := 0;
  end;
end;
 
procedure fl_break(n: integer := 0); begin
  new FlowBreak(n);
end;

procedure text(s: string := '~'); begin
  new TextLabel(s);
end;   

///Dropdown initialization
procedure dropdown(idx: integer; box: combobox; params p: array of string); begin
  for var i := 0 to p.length - 1 do
    box.items.add(p[i]);
  box.selectedindex := idx;
end;

procedure text_box; begin
  ParentControl := MainForm;
  
  mainPanel.Dock := DockStyle.Left;
  mainPanel.Height := 169;
  mainPanel.Width := 140;
 
  box := new textbox;
  box.dock := dockstyle.fill;
end;

///Menu elements
procedure menu(); begin
  ///Первый элемент
  first_number := new realfield(msg[1]);
  fl_break;
  
  ///Второй элемент
  second_number := new realfield(msg[2]);
  fl_break;
  
  ///Выбор оператора
  text(msg[3]);
  fl_break(1); 
  v_operator := new combobox;
  
  ///Кнопка
  fl_break;
  v_button := new button(msg[4]);

  ///Initialisation
  dropdown(0, v_operator, '+', '-', '*', '/');
end;

procedure on_click; begin
  var res := calc(first_number.value, second_number.value, v_operator.selectedindex);
  box.addline($'{first_number.value} {v_operator.selectedvalue} {second_number.value} = {res.ToString}');
end;

procedure init; begin
  ///Window params
  form.title := msg[0];  
  size(350, 209);
  centred;

  ///Menu initializationg
  menu();
  
  ///Functions
  v_button.click += on_click;
  text_box();
end;

begin
  init();
end.
{ Copyright (c) 2018-2020 Death#4932 }