unit unit_renderer;

  interface
  uses GraphABC, ABCSprites, ABCObjects, Events;
  const size_x = 32;
        size_y = 32; 
  
  type render = auto class
      texture_static : picture;
    end;

  var renderer := new render;
  
  ///Screen params
  var screen := System.Windows.Forms.Screen.PrimaryScreen.Bounds;
  var global_height := screen.height;
  var global_width  := screen.width;
  
  ///Static texture rendering
  procedure static_texture(x, y: integer; image: string);
  
  implementation
  ///Static texture rendering
  procedure static_texture(x, y: integer; image: string); begin
    renderer.texture_static := picture.create(size_x, size_y);
    renderer.texture_static.load(image);
    renderer.texture_static.draw(x, y);
  end;
 end.