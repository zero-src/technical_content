unit local_player;
  
  interface
  uses ABCSprites;
  
  type movement = class
    procedure controls(BOOL: boolean);
    
    procedure ground(key: integer);
    procedure air(key: integer);
  end;
  
  var lp := new SpriteABC(150, 199, 'E:\endgame\animlayers\local_anims\spr.spinf');
  procedure movement_hybrid(key: integer);
  
  implementation
  uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
  uses GraphABC, ABCObjects, ABCSprites;
  
  procedure movement_hybrid(key: integer);
  begin
    case key of
      65: lp.MoveOn(-7,  0);  // VK_A
      68: lp.MoveOn( 7,  0);  // VK_D
      87: lp.MoveOn( 0, -7);  // VK_W
      83: lp.MoveOn( 0,  7);  // VK_S
    end;
  end;
  
  procedure movement.ground(key: integer);
  begin    
    case key of
      65: lp.MoveOn(-7, 0); // VK_A
      68: lp.MoveOn(7, 0);  // VK_D
    end;
  end;
  
  procedure movement.air(key: integer);
  begin
    case key of
      87: lp.MoveOn(0, -7); // VK_W
      83: lp.MoveOn(0, 7);  // VK_S
    end;
  end;
  
  procedure movement.controls(BOOL: boolean);
  begin
    while BOOL do
    begin
      OnKeyDown := movement_hybrid;
    end;
  end;
end. 