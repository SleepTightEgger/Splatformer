class player {
  PVector position;
  PVector velocity;
  boolean goLeft;
  boolean goRight;
  boolean isInAir;
  player() {
    position = new PVector(200, 200);
    velocity = new PVector(0, 1);
    isInAir = true;
  }

  void drawPlayer() {
    rectMode(CENTER);
    fill(255);
    rect(position.x, position.y, width/40, width/40);
  }

  void moveCharacter() {
    if (goLeft) {
      position.x -= 10;
    }
    if (goRight) {
      position.x += 10;
    }
  }

  void jump() {
    isInAir = true;
    velocity.y = -15;
    position.add(velocity);
  }

  void gravity() {
    if (isInAir) {
      velocity.y += 1;
      position.add(velocity);
    } else {
      velocity.y = 0;
    }
    if (position.y + width/80 >= height) {
      isInAir = false;
      position.y = height - width/80;
    }
  }
}
