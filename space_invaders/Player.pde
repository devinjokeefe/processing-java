class Player {

  int xpos; int ypos;
  int livesLeft = 3;
  color paddlecolor = color(255);
  int timeSincePress = 0;;
  
  Player() {
    xpos=SCREEN_X/2;
    ypos=SCREEN_Y-PADDLEHEIGHT-MARGIN;
  }
  
  int x() {
    return xpos;
  }
  
  int y() {
    return ypos;
  }

  void move(int x){
    if (x > SCREEN_X-PADDLEWIDTH) xpos = SCREEN_X-PADDLEWIDTH;
    else xpos=x;
  }

  void draw() {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
    timeSincePress ++;
  }
  
  void loseLife () {
    livesLeft--;
    println(livesLeft);
  }
}
