class splatter {
  PVector position;
  PVector velocity;
  float size;
  color paintColor;
  
  splatter(float x, float y, color c){
    position = new PVector(x, y);
    velocity = new PVector(random(-5,5), random(-5,0));
    size = random(30, 50);
    paintColor = c;
  }
  
  void gravity() {
    velocity.y += 0.05;
    position.add(velocity);
  }
  
  void display() {
    fill(paintColor);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }
  
  boolean hit(float x, float y, float w, float h){
    return position.x > x && position.x < x + w && position.y > y && position.y < y + h;
  }
}
