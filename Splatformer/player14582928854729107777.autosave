class player {
  PVector position;
  PVector velocity;
  boolean goLeft;
  boolean goRight;
  boolean isInAir;
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
    for (int i = platforms.size() - 1; i >= 0; i--){
      platforms p = platforms.get(i);
      if (position.x + width/80 > p.position.x - p.sizeX/2 && position.x - width/80 < p.position.x + p.sizeX/2 && position.y + width/80 <= p.position.y - p.sizeY/2 && position.y + width/80 + velocity.y >= p.position.y - p.sizeY/2){
        position.y = p.position.y - p.sizeY/2 - width/80;
        isInAir = false;
        break;
      } else {
        isInAir = true;
      }
    }    
  }
}
