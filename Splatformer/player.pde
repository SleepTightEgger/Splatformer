class player {
  PVector position;
  PVector velocity;
  boolean goLeft;
  boolean goRight;
  player() {
    position = new PVector(200,200);
    velocity = new PVector(0,1);
  }
  
  void drawPlayer(){
    rectMode(CENTER);
    fill(255);
    rect(position.x, position.y, width/40, width/40);
  }
  
  void moveCharacter(){
    if (goLeft){
      position.x -= 10;
    }
    if (goRight){
      position.x += 10;
    }
  }
  
  void gravity(){
    position.add(velocity);
  }
}
