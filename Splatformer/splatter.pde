class splatter {
  PVector position;
  PVector velocity;
  float size;
  color paintColor;
  
  splatter(float x, float y, color c){
    position = new PVector(x, y);
    velocity = new PVector(random(-5,5), random(-5,5));
    size = random(10, 20);
    paintColor = c;
  }
  
  void gravity() {
    velocity.y += 0.1;
    position.add(velocity);
  }
  
  void display() {
    fill(paintColor);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }
}
