unit local_player;
  
  interface
  uses ABCSprites;
  
  type movement = class
    procedure ground(lp: SpriteABC; key: integer);
    procedure air(key: integer);
  end;
  
  implementation
  uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
  uses GraphABC, ABCObjects, ABCSprites;
  
  procedure movement.ground(lp: SpriteABC; key: integer);
  begin    
    case key of
      65: lp.MoveOn(-15, 0);
      68: lp.MoveOn(15, 0);
    end;
  end;
  
  procedure movement.air(key: integer);
  begin
    
  end;
end. 