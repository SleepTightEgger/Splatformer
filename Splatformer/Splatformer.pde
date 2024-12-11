ArrayList<platforms> platforms;
ArrayList<splatter> splatter;
ArrayList<marks> marks;
player player = new player();
Level level = new Level();

boolean gameOver;
boolean gameWon;
String screenText;

void setup() {
  size(1920, 1080);
  colorMode(HSB, 255);

  splatter = new ArrayList<splatter>();
  marks = new ArrayList<marks>();
  level.init();
}

void draw() {
  if (!gameOver) {
    background(177, 212, 69);

    level.display();

    player.drawPlayer();
    player.moveCharacter();
    player.gravity();

    textSize(40);
    textAlign(CENTER);
    text(level.text, width/2, height/2);

    if (player.position.y > height) {
      player.lives--;
      if (player.lives == 0) {
        platforms.clear();
        marks.clear();
        gameOver = true;
      } else {
        player.position = new PVector(level.playerStart.x, level.playerStart.y);
      }
    }
    if (gameWon) {
      background(177, 212, 69);
      screenText();
      if (keyPressed == true && key == 'x') {
        player.lives = 5;
        level.level = 1;
        level.loadLevel();
        gameWon = false;;
      }
    }
  } else if (gameOver) {
    background(177, 212, 69);
    screenText();
    if (keyPressed == true && key == 'x') {
      player.lives = 5;
      level.level = 1;
      level.loadLevel();
      gameOver = false;
    } else if (gameWon){
      
    }
  }
}

void screenText() {
  if (gameOver == true){
    screenText = "GAME OVER\n Press x to play again";
  } else if (gameWon == true){
     screenText = "YOU WIN\n Press x to play again";
  }
  textSize(40);
  textAlign(CENTER);
  text(screenText, width/2, height/2);
}

void keyPressed() {
  if (key == 'a') {
    player.goLeft = true;
  }
  if (key == 'd') {
    player.goRight = true;
  }
  if (key == 'w' || key == ' ') {
    if (player.jumpCount < 2) {
      player.jump();
    }
  }
}

void keyReleased() {
  if (key == 'a') {
    player.goLeft = false;
  }
  if (key == 'd') {
    player.goRight = false;
  }
}
