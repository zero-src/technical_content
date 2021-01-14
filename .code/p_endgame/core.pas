unit core;

  interface

  type world_render = class    
    ///World generation
    procedure o_flat(y: integer);
    procedure n_flat(y: integer);
    
    ///Environment
    procedure clouds_initialization;
    procedure clouds;
  end;
  
  implementation
  uses ABCObjects, timers, world_textures, unit_renderer in 'E:\endgame\textures\object_renderer.pas';
  
  ///Flat generation method
  procedure world_render.o_flat(y: integer);
  begin
    var x_loop := trunc((global_width + 5) / size_block_x);
    var y_loop := trunc((global_height - size_block_y * y) / size_block_y);
    
    var x_pos := 0;
    loop x_loop do
    begin
      var y_pos := y * size_block_y + size_block_y;
      static_texture(x_pos, y * size_block_y, png_grass);
      
      loop y_loop do
      begin
        static_texture(x_pos, y_pos, png_stone);
        inc(y_pos, size_block_y);
      end;
      
      inc(x_pos, size_block_x);
    end;
  end;
  
  ///Test method
  procedure world_render.n_flat(y: integer);
  begin

  end;
  
  ///Clouds rendering
  procedure world_render.clouds;
  begin
    static_texture(random(global_width), size_cloud_y + random(100), png_clouds[0]);
  end;
  
  ///Clouds initialization
  procedure world_render.clouds_initialization;
  begin
    var t := new timer(500, clouds);
    
    t.Start;
    Sleep(500);
  end;
end.