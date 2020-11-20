final int BULLET_X_SPEED = 5; // Constant of bullet speed

class Bullet {
  // Important variables for the bullet class defined at the top
  int xPos;
  int yPos;
  color bulletColour = color(255);
  int bulletRadius = 20;

  // Bullet constructor
  Bullet (int initXPos, int initYPos) {
    this.xPos = initXPos;
    this.yPos = initYPos;
  }
  
  void draw () {
    xPos += BULLET_X_SPEED; // Move bullet at constant rate
    fill(bulletColour); // Bullet is whatever colour we defined in our variable
    ellipse(xPos, yPos, bulletRadius, bulletRadius); // Bullet is a circle, at (xpos, ypos) with a radius of bulletRadius.
  }
  
  // Iterate throuhg all eneimes to check if the bullet has collided with any of them
  boolean collide(Enemy[] playerEnemies) {
    int enemyRadius = playerEnemies[0].enemyRadius;
    
    if (playerEnemies.length > 0) {
      for (int i = 0; i < playerEnemies.length; i++) {
        int enemyX = playerEnemies[i].xPos;
        int enemyY = playerEnemies[i].yPos;
      
        if (dist(xPos, yPos, enemyX, enemyY) <= (bulletRadius + enemyRadius)) { // Check if the radii are less and thus the circles have collided
          playerEnemies[i].respawn();
          return true;
        }
      }
    }    
    return false;
  }
}
