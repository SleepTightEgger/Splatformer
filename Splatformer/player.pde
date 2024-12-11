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
  
  //player constructor
  player() {
    // create new position  vector, gets overrided at the start anyways
    position = new PVector(1000, 200);
    // create new velocity vector set to one to act as gravity
    velocity = new PVector(0, 1);
    // set isInAir boolean to true to make the player fall from the sky right away;
    isInAir = true;
    // set jumpCount to 0 to allow player to double jump
    jumpCount = 0;
  }
  
  // touching wall boolean function
  boolean touchingWall() {
    // for each platform in the array list
    for (int i = platforms.size() - 1; i >= 0; i--) {
      // get that instance of platform
      platforms p = platforms.get(i);
      // if the player is overlapping with the platform from the left side then;
      if (position.x + 32 >= p.position.x - p.sizeX/2 && position.x + 32 < p.position.x - p.sizeX/2 + 15 &&
        position.y + 32 > p.position.y - p.sizeY/2 && position.y - 32 < p.position.y + p.sizeY/2) {
        // set the player position to the position of the wall minus player half of player size
        position.x = p.position.x - p.sizeX/2 - 32;
        // if the player is moving downwards while touching the wall then
        if (velocity.y > 0) {
          // add a mark based on players position against the wall, set the colour to frameCount%255, cycling through the rainbow, set a random size from 30-50;
          marks.add(new marks(position.x + 32, position.y, color(frameCount%255, 255, 255), random(30, 50)));
        }
        // set the player jump count to 0, allowing for wall jumps
        jumpCount = 0;
        // set the leftWall boolean to true
        leftWall = true;
        // return true for touchingWall
        return true;
      }
      // repeat for right side
      if (position.x - 32 <= p.position.x + p.sizeX/2 && position.x - 32 > p.position.x + p.sizeX/2 - 15  &&
        position.y + 32 > p.position.y - p.sizeY/2 && position.y - 32 < p.position.y + p.sizeY/2) {
        position.x = p.position.x + p.sizeX/2 + 32;
        if (velocity.y > 0) {
          marks.add(new marks(position.x - 32, position.y, color(frameCount%255, 255, 255), random(30, 50)));
        }
        jumpCount = 0;
        leftWall = false;
        return true;
      }
    }
    // if neither are true set leftWall to false
    leftWall = false;
    // return false for touchingWall
    return false;
  }
  
  //draw player function
  void drawPlayer() {
    // draw a white rectangle
    rectMode(CENTER);
    fill(255);
    rect(position.x, position.y, width/40, width/40);
  }
  
  // move character function
  void moveCharacter() {   
    // if go left boolean is true then
    if (goLeft) {
      // decrement the x position by 10
      position.x -= 10;
      // call draw marks function
      drawMarks();
    }
    // repeat for right side
    if (goRight) {
      // increment x position by 10
      position.x += 10;
      // call draw marks
      drawMarks();
    }
    // check if player is touching wall by calling touching wall boolean function
    touchingWall();
  }
  
  // draw marks function
  void drawMarks() {
    // if the player is not in the air/ is on the ground then
    if (!isInAir) {
      // add a mark based on players position on the ground, set the colour to frameCount%255, cycling through the rainbow, set a random size from 30-50;
      marks.add(new marks(position.x, position.y + width/80, color(frameCount%255, 255, 255), random (30, 50)));
    }
  }
  
  // player jump function
  void jump() {
    // set is in air to true
    isInAir = true;
    // if the player is touching a wall and it is a left wall then
    if (touchingWall() && leftWall == true) {
      // set x velocity, pushing player away from the wall
      velocity.x -= 5;
      // else if the player is touching a wall and it is not the left wall then
    } else if (touchingWall() && leftWall == false) {
      // set x velocity, pushing player away from the wall
      velocity.x += 5;
    } else {
      // else set x velocity to 0, that way player does not have x velocity unless they are jumping off of a wall
      velocity.x = 0;
    }
    // set the y velocity to negative number, allowing player to jump in the air
    velocity.y = -15;
    // add the velocity vector to the playrs current vector
    position.add(velocity);
    // increment the jump count
    jumpCount += 1;
    // if the player is doing their double jump then
    if (player.jumpCount == 2) {
      // set a local splatter count variable and generate a random number between a range, converting to an integer
      int numSplatters = (int)random(15, 20);
      // for each iteration where the iterations are less than the random number generated then
      for (int i = 0; i < numSplatters; i++) {
        // add a new splatter to the splatter arraylist based on the players current position, set the colour to frameCount%255, cycling through the rainbow
        splatter.add(new splatter(player.position.x, player.position.y, color(frameCount%255, 255, 255)));
      }
    }
  }
  
  // player gravity function
  void gravity() {
    // if the player is in the air then
    if (isInAir) {
      // if they are also touching a wall and moving downwards then
      if (touchingWall() && velocity.y > 0) {
        // set the gravity variable to much lower than normal
        gravity = 0.1;
        // increment y velocity by an amount equal to the gravity variable
        velocity.y += gravity;
      } else {
        // otherwise if the player is not touching a wall, gravity is a default setting
        gravity = 1;
        // increment y velocity by an amount equal to the gravity variable
        velocity.y += gravity;
      }
      // add the current y velocity to the players position, creating downward acceleration/gravity
      position.add(velocity);
      // else if the player is not in the air then
    } else {
      // set y velocity to 0
      velocity.y = 0;
    }
    // for each of the platforms in the platform array list
    for (platforms p : platforms) {
      // if the player is overlapping with the platform and has a downward velocity then
      if (position.x + width/80 > p.position.x - p.sizeX/2 && position.x - width/80 < p.position.x + p.sizeX/2 && position.y + width/80 <= p.position.y - p.sizeY/2 && position.y + width/80 + velocity.y >= p.position.y - p.sizeY/2) {
        // set the player position to the position of the ground/top of the platform minus player half of player size, done to snap the player to the ground
        position.y = p.position.y - p.sizeY/2 - width/80;
        // set is in air boolean to false
        isInAir = false;
        // reset jumpcount to 0
        jumpCount = 0;
        break;
      } else {
        // else if the player is no longer overlapping with the platform with a downward velocity, set is in air boolean to true
        isInAir = true;
      }
    }
  }
}
