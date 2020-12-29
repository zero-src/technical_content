uses local_animations in 'E:\endgame\animlayers\local_animations.pas';
uses unit_renderer   in 'E:\endgame\textures\unit_renderer.pas';
uses core, o_params;

begin
  var world_renderer: world_render;
  world_renderer := world_render.create;
  
  window_setup;
  world_renderer.o_flat(15); //value in blocks
end.