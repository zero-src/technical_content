unit object_renderer;

  interface
  uses GraphABC, ABCSprites, ABCObjects, Events;
  const size_block_x = 32;
        size_block_y = 32;
        size_cloud_x = 96;
        size_cloud_y = 64;
  
  type render = auto class
      texture_static : pictureabc;
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
  procedure static_texture(x, y: integer; image: string) := 
    renderer.texture_static := PictureABC.Create(x, y, image);
 end.