player player = new player();

void setup(){
  size(1920, 1080);
  colorMode(HSB, 255);
}

void draw(){
  background(177,212,69);
  
  player.drawPlayer();
  player.moveCharacter();
  player.gravity();
}

void keyPressed(){
    if (key == 'a') {
    player.goLeft = true;
  }
  if (key == 'd') {
    player.goRight = true;
  }
}

void keyReleased(){
  if (key == 'a') {
    player.goLeft = false;
  }
  if (key == 'd') {
    player.goRight = false;
  }
}
