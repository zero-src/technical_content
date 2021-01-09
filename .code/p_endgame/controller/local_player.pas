unit local_player;
  
  interface
  uses GraphABC, ABCSprites, ABCObjects;
  const speed = 9;
  
  type movement = class
    procedure controls(BOOL: boolean := false);
    
    procedure ground(key: integer);
    procedure air(key: integer);
  end;
  
  var lp  := new SpriteABC(150, 192, 'E:\endgame\animlayers\local_anims\stand.spinf');
  
  var txt := new TextABC(55, 30, 11,'local_player.state: ' + lp.StateName, clRed);
  var ext := new TextABC(55, 50, 11,'KeyDownID: '  + lp.StateName, clRed);
  
  procedure movement_hybrid(key: integer);
  
  implementation
  uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
  uses GraphABC, ABCObjects, ABCSprites;
  
  procedure movement_hybrid(key: integer);
  begin
    case key of
      65: lp.MoveOn(-speed,  0);  // VK_A
      68: lp.MoveOn( speed,  0);  // VK_D
      87: lp.MoveOn( 0, -speed);  // VK_W
      83: lp.MoveOn( 0,  speed);  // VK_S
    end;
    
    ///Basic animation changes
    {if (key = 65) or (key = 68) then
      lp.State := 1
    else 
      if key = 17 then
        lp.State := 3
      else 
        lp.State := 2;}
         
    
    txt.Text := 'local_player.state: ' + lp.State;
    ext.Text := 'KeyDownID: ' + key;
  end;
  
  procedure movement.ground(key: integer);
  begin    
    case key of
      65: lp.MoveOn(-speed, 0);  // VK_A
      68: lp.MoveOn( speed, 0);  // VK_D
    end;
  end;
  
  procedure movement.air(key: integer);
  begin
    case key of
      87: lp.MoveOn(0, -speed);  // VK_W
      83: lp.MoveOn(0,  speed);  // VK_S
    end;
  end;
  
  procedure movement.controls(BOOL: boolean);
  begin
      OnKeyDown := movement_hybrid;
  end;
end. 