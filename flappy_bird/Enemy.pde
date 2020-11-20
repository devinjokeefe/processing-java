final int ENEMY_SPEED = 10;

class Enemy {
  int xPos;
  int yPos;
  color enemyColour = color(128, 128, 128);
  int enemyRadius;
  
  int x_direction = ENEMY_SPEED;
  
  //Enemy constructor
  Enemy (int initX, int initY, int initRadius) {
    this.xPos = initX;
    this.yPos = initY;
    this.enemyRadius = initRadius;
  }
  
  //Draw the enemy and move left
  void draw () {
    fill(enemyColour);
    ellipse(xPos, yPos, enemyRadius, enemyRadius);
    xPos -= ENEMY_SPEED;
  }
  
  //Respawn enemy at edge
  void respawn () {
    xPos = SCREEN_WIDTH;
    yPos = (int) random(0, SCREEN_HEIGHT);
  }
  
  //Setting functions
  void setXPos (int newXPos) {
    this.xPos = newXPos;
  }
  
  void setYPos (int newYPos) {
    this.yPos = newYPos; 
  }
  
  //Getting functions
  int getXPos () {
    return xPos;
  }
  
  int getYPos () {
    return yPos;
  }
  
  //Check for collision with players
  boolean playerCollision (int playerXPos, int playerYPos, int playerRadius) {
    if (dist(playerXPos, playerYPos, xPos, yPos) <= (enemyRadius + playerRadius)) {
      return true; 
    }
    
    else {
      return false;
    }
  }
  
  //Check if enemy is off screen
  boolean isOffScreen () {
    if (xPos < 0) {
      return true; 
    }
    
    else {
      return false;
    }
  }
}
