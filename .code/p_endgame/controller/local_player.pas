unit local_player;
  
  interface
  uses GraphABC, ABCSprites, ABCObjects, object_renderer;
  
  ///Local_player speed
  const SPEED = 5;
  
  ///Movement class
  type movement = class
    ///Global controller initialization
    procedure player_controls;
    
    ///Separated controllers
    procedure ground(key: integer);
    procedure air(key: integer);
  end;
  
  ///Global variables
  VAR BOOL := TRUE;

  ///Local_player model
  var lp := new SpriteABC(SPEED, 192, 'E:\endgame\animlayers\local_anims\stand.spinf');
  
  ///Allowded coordinats
  var ald_x: sequence of integer := range(SPEED, global_width  - 64); 
  var ald_y: sequence of integer := range(SPEED, global_height - 130);
  
  ///Debug text
  var t1 := new TextABC(55,  30, 10, 'local_player.state: ' + lp.StateName, clRed);
  var t2 := new TextABC(55,  50, 10, 'KeyDownID: ' + lp.StateName, clRed);
  var t3 := new TextABC(55,  70, 10, 'KeyUpID: ' + lp.StateName, clRed);
  
  ///Hotkeys
  procedure movement_hybrid_down (key: integer);
  procedure movement_hybrid_up   (key: integer);
  
  implementation
  uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
  uses GraphABC, ABCObjects, ABCSprites, Events, Timers;
  
  ///Movement OnKeyDown
  procedure movement_hybrid_down(key: integer);
  begin
    ///Except keys
    var (e_key_x, e_key_y) := (0, 0);
    
    ///Clamped angles
    if not (lp.position.x in ald_x) then
      e_key_x := lp.position.x <= ald_x.min ? 65 : 68;
    
    if not (lp.position.y in ald_y) then
      e_key_y := lp.position.y <= ald_y.min ? 87 : 83;
      
    ///Default movement
    case key of
      65: lp.MoveOn(e_key_x <> 65 ? -SPEED : 0,  0);  // VK_A
      68: lp.MoveOn(e_key_x <> 68 ?  SPEED : 0,  0);  // VK_D
      87: lp.MoveOn( 0, e_key_y <> 87 ? -SPEED : 0);  // VK_W
      83: lp.MoveOn( 0, e_key_y <> 83 ?  SPEED : 0);  // VK_S
    else
      lp.MoveOn(0, 0);
    end;
    
    ///Digging methods
    if (key = 69) and BOOL then   // VK_E
    begin
      lp.MoveOn( 0, -SPEED*2);
      BOOL := FALSE;
    end;
    
    ///Debug text
    t1.Text := 'local_player.state: ' + lp.State;
    t2.Text := 'KeyDownID: ' + key;
    t3.Text := 'pos: ' + lp.Position.ToString;
  end;
  
  ///Movement OnKeyUp
  procedure movement_hybrid_up(key: integer);
  begin
    case key of
      65: lp.MoveOn(0, 0);  // VK_A
      68: lp.MoveOn(0, 0);  // VK_D
      87: lp.MoveOn(0, 0);  // VK_W
      83: lp.MoveOn(0, 0);  // VK_S
    else
      lp.MoveOn(0, 0);
    end;
    
    if (key = 69) and not BOOL then // VK_E
    begin
      lp.MoveOn( 0, SPEED*2);
      BOOL := TRUE;
    end;
    
    t1.Text := 'KeyUpID: ' + key;
  end;
  
  ///Comming soon..
  procedure movement.ground(key: integer);
  begin    
    case key of
      65: lp.MoveOn(-SPEED, 0);  // VK_A
      68: lp.MoveOn( SPEED, 0);  // VK_D
    end;
  end;
  
  ///Comming soon..
  procedure movement.air(key: integer);
  begin
    case key of
      87: lp.MoveOn(0, -SPEED);  // VK_W
      83: lp.MoveOn(0,  SPEED);  // VK_S
    end;
  end;
  
  ///Initialization of player controller
  procedure movement.player_controls;
  begin
      OnKeyDown := movement_hybrid_down;      
      OnKeyUp   := movement_hybrid_up;
  end;
end. 