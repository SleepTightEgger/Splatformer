class platforms {
  PVector position;
  float sizeX;
  float sizeY;

  platforms (float x, float y, float w, float h) {
    position = new PVector(x, y);
    sizeX = w;
    sizeY = h;
  }

  void display() {
    //fill(200);
    //rect(position.x, position.y, sizeX, sizeY);
  }

  void splatter() {
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
    for (int i = splatter.size() - 1; i >=0; i--) {
      splatter s = splatter.get(i);
      s.display();
      s.gravity();
      
      if (s.hit(position.x - sizeX/2, position.y - sizeY/2, sizeX, sizeY)){
        marks.add(new marks(s.position.x, s.position.y, s.paintColor, s.size));
        splatter.remove(i);
      }
    }
  }  
}
