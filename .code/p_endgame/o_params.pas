unit o_params;

  interface
  procedure window_setup;

  implementation 
  uses GraphABC, ABCSprites, ABCObjects, Events;
  
    procedure window_setup;
    begin
      window.title := 'Endgame';
      window.maximize;
    end;
end.