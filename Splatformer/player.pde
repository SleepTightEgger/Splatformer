class player {
  PVector position;
  PVector velocity;
  boolean goLeft;
  boolean goRight;
  boolean isInAir;
  boolean leftWall;
  float gravity;
  int jumpCount;
  int lives = 5;

  player() {
    position = new PVector(1000, 200);
    velocity = new PVector(0, 1);
    isInAir = true;
    jumpCount = 0;
  }
  
  boolean touchingWall() {
    for (int i = platforms.size() - 1; i >= 0; i--) {
      platforms p = platforms.get(i);
      if (position.x + 32 >= p.position.x - p.sizeX/2 && position.x + 32 < p.position.x - p.sizeX/2 + 15 &&
        position.y + 32 > p.position.y - p.sizeY/2 && position.y - 32 < p.position.y + p.sizeY/2) {
        position.x = p.position.x - p.sizeX/2 - 32;
        if (velocity.y > 0) {
          marks.add(new marks(position.x + 32, position.y, color(frameCount%255, 255, 255), random(30, 50)));
        }
        jumpCount = 0;
        leftWall = true;
        return true;
      }
      if (position.x - 32 <= p.position.x + p.sizeX/2 && position.x - 32 > p.position.x + p.sizeX/2 - 15  &&
        position.y + 32 > p.position.y - p.sizeY/2 && position.y - 32 < p.position.y + p.sizeY/2) {
        position.x = p.position.x + p.sizeX/2 + 32;
        if (velocity.y > 0) {
          marks.add(new marks(position.x - 32, position.y, color(frameCount%255, 255, 255), random(30, 50)));
        }
        leftWall = false;
        return true;
      }
    }
    leftWall = false;
    return false;
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
    touchingWall();
  }

  void drawMarks() {
    if (!isInAir) {
      marks.add(new marks(position.x, position.y + width/80, color(frameCount%255, 255, 255), random (30, 50)));
    }
  }

  void jump() {
    isInAir = true;
    if (touchingWall() && leftWall == true) {
      velocity.x -= 5;
    } else if (touchingWall() && leftWall == false) {
      velocity.x += 5;
    } else {
      velocity.x = 0;
    }
    velocity.y = -15;
    position.add(velocity);
    jumpCount += 1;
    if (player.jumpCount == 2) {
      int numSplatters = (int)random(15, 20);
      for (int i = 0; i < numSplatters; i++) {
        splatter.add(new splatter(player.position.x, player.position.y, color(frameCount%255, 255, 255)));  // Random color
      }
    }
  }

  void gravity() {
    if (isInAir) {
      if (touchingWall() && velocity.y > 0) {
        gravity = 0.1;
        velocity.y += gravity;
      } else {
        gravity = 1;
        velocity.y += gravity;
      }
      position.add(velocity);
    } else {
      velocity.y = 0;
    }
    for (platforms p : platforms) {
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
