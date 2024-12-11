class platforms {
  PVector position;
  float sizeX;
  float sizeY;
  
  // platform constructor, taking in x and why positions, as well as width and height
  platforms (float x, float y, float w, float h) {
    position = new PVector(x, y);
    sizeX = w;
    sizeY = h;
  }
  
  // display function, only for debugging, doesn't get called during runtime, would just show white boxes where platforms are
  void display() {
    fill(200);
    rect(position.x, position.y, sizeX, sizeY);
  }
  
  // splatter function
  void splatter() {
    //draw series of rectangles depending on the level to cut mark ellipses in half and give the apearance of paint applied to a surface.
    // called here to draw over the marks, could've been in level manager instead
    noStroke();
    fill(177, 212, 69);
    if (level.level == 1) {
      rect(width/2, height/2, width/1.6, height/3);
    } else if (level.level == 2) {
      rect(width/3.2, height/2, width/4, height/3);
      rect(width-width/3.2, height/2, width/4, height/3);
      rect(width/2, height/2.25, width/8, height/4.5);
    }
    noStroke();
    // for each splatter in the array list
    for (int i = splatter.size() - 1; i >=0; i--) {
      // get that element in the splatter array list
      splatter s = splatter.get(i);
      // display the splatter
      s.display();
      // apply gravity to the splatter
      s.gravity();
      
      // if the splatter collides witht he platforms area then
      if (s.hit(position.x - sizeX/2, position.y - sizeY/2, sizeX, sizeY)){
        // add a new mark where the splatter collided, taking its colour and size
        marks.add(new marks(s.position.x, s.position.y, s.paintColor, s.size));
        // remove the collided splatter from the arraylist
        splatter.remove(i);
      }
    }
  }  
}
