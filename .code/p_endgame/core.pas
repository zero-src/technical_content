unit core;

  interface

  type world_render = class
    procedure o_flat(y: integer);
    procedure n_flat(y: integer);
  end;
  
  implementation
  uses world_textures, unit_renderer in 'E:\endgame\textures\object_renderer.pas';

  procedure world_render.o_flat(y: integer);
  begin
    var x_loop := trunc((global_width + 5) / size_x);
    var y_loop := trunc((global_height - size_y * y) / size_y);
    
    var x_pos := 0;
    loop x_loop do
    begin
      var y_pos := y * size_y + size_y;
      static_texture(x_pos, y * size_y, png_grass);
      
      loop y_loop do
      begin
        static_texture(x_pos, y_pos, png_stone);
        inc(y_pos, size_y);
      end;
      
      inc(x_pos, size_x);
    end;
  end;
  
  
  procedure world_render.n_flat(y: integer);
  begin

  end;
end.