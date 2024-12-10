class Level {
  PVector playerStart;
  String text;
  int level;

  Level() {
    level = 1;
  }

  void init() {
    loadLevel();
  }

  void loadLevel() {
    platforms = new ArrayList<platforms>();
    if (level == 1) {
      platforms.add(new platforms(width/2, height-height/8, width/4, height/12));
      platforms.add(new platforms(width-width/4, height-height/4, width/4, height/12));
    }
  }

  void display() {
    for (int i = marks.size() - 1; i >=0; i--) {
      marks m = marks.get(i);
      m.display();
    }
    for (int i = platforms.size() - 1; i >= 0; i--) {
      platforms p = platforms.get(i);
      p.display();
      p.splatter();
    }
  }
}
