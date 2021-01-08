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

end.