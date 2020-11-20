class Ball {
  float x; float y;
  float dx; float dy;
  int hits = 0;
  int radius;
  color ballColor = color(255);
  boolean gameOver = false;
  
  Ball(){
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 3); dy = random(1, 3);
    radius=5;
  }
  
  void move(){
    x = x+dx; y = y+dy;
  }

  void draw(){
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
    textSize(12);
    text("Current speed: " + abs(dy), MARGIN, SCREENY/2);
    fill(255);
  }
  
  void wallCollision () {
    if (x-radius <=0 || x+ radius>=SCREENX) {
      dx=-dx;
    }
  }
  
  void collide(Player tp){
    
    if(y >= tp.ypos && 
       y-radius<tp.ypos+PADDLEHEIGHT &&
       x >=tp.xpos &&
       x <= tp.xpos+PADDLEWIDTH) {
         float multiplier = 1.03;
         dy=-dy*multiplier;
         
         if (pmouseX-mouseX > 0) {
           dx = abs(dx); 
         }
         
         else {
           dx = -abs(dx);
         }
         
         println(dy);
         hits++;
     }
  }
  
  void reset() {
        
    if (y <= 0 || y >= SCREENY) {
      if (y <= 0) theCPU.loseLife();
      else if (y >= SCREENY) thePlayer.loseLife();
      x = SCREENX/2;
      y = SCREENY/2;
      dy = 0; dx = 0;
    }
    
    if (theCPU.livesLeft <= 0) {
      PFont myFont = loadFont("MonotypeCorsiva-18.vlw");
      textFont(myFont);
      textSize(24);
      text(CPU_LOSES, (SCREENX-textWidth(CPU_LOSES))/2, SCREENY/2);
      fill(255);
      gameOver = true;
    }
    
    else if (thePlayer.livesLeft <= 0) {
      PFont myFont = loadFont("MonotypeCorsiva-18.vlw");
      textFont(myFont);
      textSize(24);
      text(PLAYER_LOSES, (SCREENX-textWidth(PLAYER_LOSES))/2, SCREENY/2);
      fill(255);
      gameOver = true;
    }          
    
    if (dx == 0 && dy == 0 && x == SCREENX/2 && y == SCREENY/2 && !gameOver) {
      if (mousePressed) {
        x = random(SCREENX/2, SCREENX/4); y = random(SCREENY/2, SCREENY/4);
        dx = random(1, 2); dy = random(1, 2);
      }
    }
  }
  
}
