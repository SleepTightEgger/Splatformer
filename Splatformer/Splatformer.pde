ArrayList<platforms> platforms;
ArrayList<splatter> splatter;
ArrayList<marks> marks;
player player = new player();
Level level = new Level();

void setup() {
  size(1920, 1080);
  colorMode(HSB, 255);

  splatter = new ArrayList<splatter>();
  marks = new ArrayList<marks>();
  level.init();
}

void draw() {
  background(177, 212, 69);
  
  level.display();

  player.drawPlayer();
  player.moveCharacter();
  player.gravity();
  
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
