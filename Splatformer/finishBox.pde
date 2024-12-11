class finishBox {
  PVector position;
  
  // finishbox constructor, taking in x and y position
  finishBox(float x, float y) {
    // set position vector based on what was passed into the argument
    position = new PVector(x, y);
  }
  
  // display function
  void display() {
    // draw a white rectangle
    stroke(255);
    strokeWeight(7);
    noFill();
    rect(position.x, position.y, 50, 64);
    // run hitbox boolean function
    hitBox();
  }
  
  // hitbox boolean function
  boolean hitBox() {
    // if the player overlaps with the finish box then
    if (player.position.x + 32 > position.x - 25 &&
      player.position.x - 32 < position.x + 25 &&
      player.position.y + 32 > position.y - 32 &&
      player.position.y - 32 < position.y + 32) {
      // clear platform and mark arraylists
      platforms.clear();
      marks.clear();
      // increment the level
      level.level++;
      // load the next level based on new level variable
      level.loadLevel();
      // return true = overlap
      return true;
    }
    // return false = no overlap
    return false;
  }
}
