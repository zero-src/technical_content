﻿uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
uses unit_renderer    in 'E:\endgame\textures\object_renderer.pas';
uses local_player     in 'E:\endgame\controller\local_player.pas';
uses core, o_params, GraphABC, ABCSprites, ABCObjects, Events;

const link: array of string = (
        'E:\endgame\animlayers\local_anims\',
        'E:\endgame\animlayers',
        'E:\endgame\controller',
        'E:\endgame\textures',
        'E:\endgame\'
      );

var lp: SpriteABC;

begin
  ///World renderer class
  var world_renderer: world_render;  
  world_renderer := world_render.create;
  
  ///Movement class
  var local_movement: movement;  
  local_movement := movement.create;
  
  window_setup;
  lp := new SpriteABC(150, 199, link[0] + 'spr.spinf');
  
  world_renderer.o_flat(9);
  local_movement.ground(lp, 68);
end.