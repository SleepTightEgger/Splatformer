class player {
  PVector position;
  PVector velocity;
  boolean goLeft;
  boolean goRight;
  boolean isInAir;
  int jumpCount;

  player() {
    position = new PVector(1000, 200);
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
      drawMarks();
    }
    if (goRight) {
      position.x += 10;
      drawMarks();
    }
  }

  void drawMarks() {
    if (!isInAir) {
      marks.add(new marks(position.x, position.y + width/80, color(frameCount%255, 255, 255), random (30,50)));
    }
  }

  void jump() {
    isInAir = true;
    velocity.y = -15;
    position.add(velocity);
    jumpCount += 1;
    if (jumpCount == 2) {
      int splatters = (int)random(5, 10);
      for (int i = 0; i < splatters; i++) {
        splatter.add(new splatter(position.x, position.y, color(frameCount%255, 255, 255)));
      }
    }
  }

  void gravity() {
    if (isInAir) {
      velocity.y += 1;
      position.add(velocity);
    } else {
      velocity.y = 0;
    }
    for (int i = platforms.size() - 1; i >= 0; i--) {
      platforms p = platforms.get(i);
      if (position.x + width/80 > p.position.x - p.sizeX/2 && position.x - width/80 < p.position.x + p.sizeX/2 && position.y + width/80 <= p.position.y - p.sizeY/2 && position.y + width/80 + velocity.y >= p.position.y - p.sizeY/2) {
        position.y = p.position.y - p.sizeY/2 - width/80;
        isInAir = false;
        jumpCount = 0;
        break;
      } else {
        isInAir = true;
      }
    }
  }
}
