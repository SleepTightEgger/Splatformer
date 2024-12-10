ArrayList<platforms> platforms;
player player = new player();

void setup() {
  size(1920, 1080);
  colorMode(HSB, 255);
  platforms = new ArrayList<platforms>();
  platforms.add(new platforms(width/2, height-height/8, width/4, height/12));
  platforms.add(new platforms(width-width/4, height-height/4, width/4, height/12));
}

void draw() {
  background(177, 212, 69);

  player.drawPlayer();
  player.moveCharacter();
  player.gravity();
  for (int i = platforms.size() - 1; i >= 0; i--) {
    platforms p = platforms.get(i);
    p.display();
  }
}

void keyPressed() {
  if (key == 'a') {
    player.goLeft = true;
  }
  if (key == 'd') {
    player.goRight = true;
  }
  if (key == 'w' || key == ' ') {
    player.jump();
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
