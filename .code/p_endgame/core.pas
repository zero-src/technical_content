unit core;

  interface

  type world_render = class
    procedure flat(y: integer);
  end;
  
  implementation
  uses world_textures, unit_renderer in 'E:\endgame\textures\unit_renderer.pas';

  procedure world_render.flat(y: integer); begin
    for var i := 0 to global_width + 5 do begin
      if i mod size_x = 0 then begin
        static_texture(i, y * size_y, png_grass);
        
        for var j := y * size_y + 1 to global_height do
          if j mod size_y = 0 then
            static_texture(i, j, png_stone);
      end;
    end;
  end;
end.