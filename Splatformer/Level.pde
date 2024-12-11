class Level {
  PVector playerStart;
  String text;
  int level;
  finishBox finish;

  Level() {
    level = 1;
  }

  void init() {
    loadLevel();
  }

  void loadLevel() {
    splatter.clear();
    platforms = new ArrayList<platforms>();
    player.isInAir = true;
    if (level == 1) {
      text = "PRESS A/D TO MOVE";
      platforms.add(new platforms(width/2, height/6, width, height/3));
      platforms.add(new platforms(width/2, height-height/6, width, height/3));
      platforms.add(new platforms(width/10.66, height/2, width/5.33, height/3));
      platforms.add(new platforms(width-width/10.66, height/2, width/5.33, height/3));
      finish = new finishBox(width-width/4, height-height/2.77);
      playerStart = new PVector(width/4, height-height/2.25);
    }
    if (level == 2) {
      text = "PRESS SPACE TO JUMP";
      platforms.add(new platforms(width/2, height/6, width, height/3));
      platforms.add(new platforms(width/2, height-height/6, width, height/3));
      platforms.add(new platforms(width/10.66, height/2, width/5.33, height/3));
      platforms.add(new platforms(width-width/10.66, height/2, width/5.33, height/3));

      platforms.add(new platforms(width/2, height-height/2.7, width/8, height/9));
      playerStart = new PVector(width/4, height-height/2.25);
    }
    if (level == 3) {
      text = "PRESS SPACE IN THE AIR TO JUMP AGAIN";
      platforms.add(new platforms(width/2, height/6, width, height/3));
      platforms.add(new platforms(width/10.66, height/2, width/5.33, height/3));
      platforms.add(new platforms(width-width/10.66, height/2, width/5.33, height/3));
      platforms.add(new platforms(width/5.8, height-height/6, width/2.9, height/3));
      platforms.add(new platforms(width-width/5.8, height-height/6, width/2.9, height/3));
      playerStart = new PVector(width/4, height-height/2.25);
    }
    if (level == 4) {
      text = "JUMP WHILE ON WALLS TO WALL JUMP";
      platforms.add(new platforms(width/10.66, height/2, width/5.33, height/2.25));
      platforms.add(new platforms(width-width/10.66, height/2, width/5.33, height/2.25));
      platforms.add(new platforms(width/2, height/2, width/8, height/2.25));
      platforms.add(new platforms(width/2, height-height/6, width, height/3));
      playerStart = new PVector(width/4, height-height/2.25);
    }
    if (level == 5) {
      text = " ";
      platforms.add(new platforms(width/32, height-height/3.6, width/16, height/1.8));
      platforms.add(new platforms(width-width/32, height-height/2.56, width/16, height/1.28));
      platforms.add(new platforms(width/5.33, height-height/18, width/4, height/9));
      platforms.add(new platforms(width/2, height-height/12, width/2.66, height/6));
      platforms.add(new platforms(width-width/5.33, height-height/7.2, width/4, height/3.6));

      platforms.add(new platforms(width/2-width/16, height/2+height/9, width/4, height/9));
      finish = new finishBox(width/2-width/16, height/2+height/36);
      playerStart = new PVector(width/8, height-height/4.5);
    }
    if (level == 6) {
      platforms.add(new platforms(width/2, height, width/8, height/4.5));
      platforms.add(new platforms(width/2, height/3.6, width/16, height/9));
      platforms.add(new platforms(width/2, height/1.636, width/16, height/9));
      finish = new finishBox(width/2, height/5.14);
      playerStart = new PVector(width/2, height-height/4.5);
    }
    if (level == 7) {
      platforms.add(new platforms(width/2, height, width/8, height/4.5));
      gameWon = true;
    }
    player.position = new PVector(playerStart.x, playerStart.y);
  }

  void display() {
    for (marks m : marks) {
      m.display();
    }
    for (platforms p : platforms) {
      p.display();
      p.splatter();
    }
    finish.display();
  }
}
