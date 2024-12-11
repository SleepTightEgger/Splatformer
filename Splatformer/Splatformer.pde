ArrayList<platforms> platforms;
ArrayList<splatter> splatter;
ArrayList<marks> marks;
player player = new player();
Level level = new Level();

boolean gameOver;
boolean gameWon;
String screenText;

void setup() {
  fullScreen();
  colorMode(HSB, 255);
  // create new arraylists for splatter and marks
  splatter = new ArrayList<splatter>();
  marks = new ArrayList<marks>();
  // initialize the level manager
  level.init();
}

void draw() {
  // if game over boolean is false then
  if (!gameOver) {
    // draw the background 
    background(177, 212, 69);
    // call level display function from level class
    level.display();
    // call player draw, move character, and gravity functions
    player.drawPlayer();
    player.moveCharacter();
    player.gravity();
    
    // display text at size 40 in the center of the screen based on text string from level class
    textSize(40);
    textAlign(CENTER);
    text(level.text, width/2, height/2);
    
    // if the player falls out of the canvas then
    if (player.position.y > height) {
      // decrement player lives variable
      player.lives--;
      // if player lives variable = 0 then
      if (player.lives == 0) {
        // clear all the platforms
        platforms.clear();
        // clear all the paint marks
        marks.clear();
        // set game over boolean to true;
        gameOver = true;
        // else, if the lives are not 0 then
      } else {
        // set player positition vector to the player start variable vector from level class
        player.position = new PVector(level.playerStart.x, level.playerStart.y);
      }
    }
    // if the player wins the game then
    if (gameWon) {
      // set the background colour
      background(177, 212, 69);
      // call the screentext function
      screenText();
      // if the player presses the x key during this screen then
      if (keyPressed == true && key == 'x') {
        // set player lives variable to 5
        player.lives = 5;
        // set the level variable in the level class to 1
        level.level = 1;
        // call the load level function from the level class
        level.loadLevel();
        // set gameWon boolean to false;
        gameWon = false;;
      }
    }
    // else if game over boolean is true;
  } else if (gameOver) {
    // set the background colour
    background(177, 212, 69);
    // call the screentext function
    screenText();
    // if the player presses the x key during this screen then
    if (keyPressed == true && key == 'x') {
      // set player lives variable to 5
      player.lives = 5;
      // set the level variable in the level class to 1
      level.level = 1;
      // call the load level function from the level class
      level.loadLevel();
      // ser gameOver boolean to false;
      gameOver = false;
    } 
  }
}

// screentext function
void screenText() {
  // if game over is true then
  if (gameOver == true){
    // set screentext string variable to game over text
    screenText = "GAME OVER\n Press x to play again";
    // else if game won is true then
  } else if (gameWon == true){
    // set screentext string variable to game won text
     screenText = "YOU WIN\n Press x to play again";
  }
  // display text at size 40 in the center of the screen based on screebtext variable string
  textSize(40);
  textAlign(CENTER);
  text(screenText, width/2, height/2);
}

void keyPressed() {
  // if key pressed is a then set player go left boolean to true
  if (key == 'a' || key == 'A') {
    player.goLeft = true;
  }
  // if key pressed is d then set player go right boolean to true
  if (key == 'd' || key == 'D') {
    player.goRight = true;
  }
  // if key pressed is w then
  if (key == 'w' || key == ' ') {
    // if the player jumpcount variable is less than 2 then
    if (player.jumpCount < 2) {
      // call player jump function
      player.jump();
    }
  }
}

void keyReleased() {
  // if a key is released then set player go left boolean to false
  if (key == 'a') {
    player.goLeft = false;
  }
  // if d key is released then set player go left boolean to false
  if (key == 'd') {
    player.goRight = false;
  }
}
