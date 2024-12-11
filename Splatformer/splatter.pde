class splatter {
  PVector position;
  PVector velocity;
  float size;
  color paintColor;
  
  //splatter constructor, taking in x and y positions and colour as arguments
  splatter(float x, float y, color c){
    // create new position vector based on arguments
    position = new PVector(x, y);
    // create a new velocity vector with random trajectory
    velocity = new PVector(random(-5,5), random(-5,0));
    // set the size to a random number between 30 and 50
    size = random(30, 50);
    // set the paint colour based on the argument
    paintColor = c;
  }
  
  // splatter gravity function
  void gravity() {
    // increment the y velocity by 0.5 each frame the splatter exists, creating downward acceleration/gravity
    velocity.y += 0.05;
    // apply the downward velocity to the splatters current position
    position.add(velocity);
  }
  
  //display function
  void display() {
    // set an ellipse based on what was passed into constructor function
    fill(paintColor);
    noStroke();
    ellipse(position.x, position.y, size, size);
  }
  
  // splatter hit detection boolean, taking in the position and size of what its colliding with as an argument
  boolean hit(float x, float y, float w, float h){
    // return true/false if the splatter overlaps with whatever it is checking against
    return position.x > x && position.x < x + w && position.y > y && position.y < y + h;
  }
}
