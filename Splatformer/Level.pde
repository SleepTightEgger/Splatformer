class Level {
  PVector playerStart;
  String text;
  int level;
  finishBox finish;
  
  // level constructor, set level int variable to 1
  Level() {
    level = 1;
  }
  
  // level manager initialization function 
  void init() {
    // call load level function, done in it's own function because processing doesn't like when you set positions with width and height in constructors
    loadLevel();
  }
  
  // load level function
  void loadLevel() {
    //clear any splatters from the array list, done at beginning of load level in case there were any splatters while previous level was finished
    splatter.clear();
    // create new platform arraylist
    platforms = new ArrayList<platforms>();
    // set player as in air 
    player.isInAir = true;
    
    // if level variable = 1 then
    if (level == 1) {
      // set level text for tutorial levels
      text = "PRESS A/D TO MOVE";
      // draw a series of invisible platforms
      platforms.add(new platforms(width/2, height/6, width, height/3));
      platforms.add(new platforms(width/2, height-height/6, width, height/3));
      platforms.add(new platforms(width/10.66, height/2, width/5.33, height/3));
      platforms.add(new platforms(width-width/10.66, height/2, width/5.33, height/3));
      // create new finish box object
      finish = new finishBox(width-width/4, height-height/2.77);
      // set player start according to level
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
    // if level variable = 7
    if (level == 7) {
      platforms.add(new platforms(width/2, height, width/8, height/4.5));
      // set game won boolean to true
      gameWon = true;
    }
    // after platforms and start/finishbox locations are loaded based on level, set the player position to the levels player start position
    player.position = new PVector(playerStart.x, playerStart.y);
  }
  
  // display function
  void display() {
    // for each paint mark in the array list
    for (marks m : marks) {
      // display the paint mark
      m.display();
    }
    // for each platform in the array list
    for (platforms p : platforms) {
      // display the platform (platforms are invisible, only enable for debugging)
      //p.display();
      // call platform splatter function, displaying the paint splatters
      p.splatter();
    }
    // display the finish box
    finish.display();
  }
}
