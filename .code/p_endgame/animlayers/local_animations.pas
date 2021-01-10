unit local_animations;

interface
  const state: array of string = (
          'stand',
          'move',
          'air',
          'crouch'
        );
      
implementation 
  uses GraphABC, ABCSprites, ABCObjects, Events;
  
    ///Basic animation changes
    {if (key = 65) or (key = 68) then
      lp.State := 1
    else 
      if key = 17 then
        lp.State := 3
      else 
        lp.State := 2;}
end.