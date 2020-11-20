class Player {
  int xpos; int ypos;
  int livesLeft = 3;
  color paddlecolor = color(255);
  
  Player(int screen_y) {
    xpos=SCREENX/2;
    ypos=screen_y;
  }

  void move(int x){
    if (x > SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }

  void draw() {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void loseLife () {
    livesLeft--;
    println(livesLeft);
  }
}
