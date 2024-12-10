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
    for (int i = splatter.size() - 1; i >=0; i--) {
      splatter s = splatter.get(i);
      s.display();
      s.gravity();
      
      if (s.hit(position.x - sizeX/2, position.y - sizeY/2, sizeX, sizeY)){
        marks.add(new marks(s.position.x, s.position.y, s.paintColor, s.size));
        splatter.remove(i);
      }
    }
    
    for (int i = marks.size() - 1; i >=0; i--) {
      marks m = marks.get(i);
      m.display();
    }
  }
  
  
}
