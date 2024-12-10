class finishBox {
  PVector position;

  finishBox(float x, float y) {
    position = new PVector(x, y);
  }

  void display() {
    stroke(255);
    strokeWeight(7);
    noFill();
    rect(position.x, position.y, 50, 64);
    hitBox();
  }

  boolean hitBox() {
    if (player.position.x + 32 > position.x - 25 &&
      player.position.x - 32 < position.x + 25 &&
      player.position.y + 32 > position.y - 32 &&
      player.position.y - 32 < position.y + 32) {
      platforms.clear();
      marks.clear();
      level.level++;
      level.loadLevel();
      return true;
    }
    return false;
  }
}
