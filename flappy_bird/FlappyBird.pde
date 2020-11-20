/* Constants at the top of our script for variables which don't change */

final int INIT_PLAYER_X = 50; //Starting x position of player
final int INIT_PLAYER_Y = 300; //Starting y position of player
final int INIT_PLAYER_COLOUR = color(255); //Player's color
final int INIT_PLAYER_CIRCLE_RADIUS = 100; //Player's circle radius

final int ENEMY_FREQUENCY = 50; //How frequently the enemy spawn
final int ENEMY_RADIUS = 50; //Circle radius of the enemy
final int MAX_NUM_ENEMIES = 20; //Maximum number of enemies on the screen at any given time

final int SCREEN_WIDTH = 1920;
final int SCREEN_HEIGHT = 1080;

final String GAME_OVER_TEXT = "Game Over";

Player myPlayer; //Instantiation of myPlayer
Enemy playerEnemies[]; //Array to keep track of all enemies
Bullet playerBullets[]; //Array to keep track of player's bullets

boolean gameOver = false;
int playerScore = 0;
int num_enemies = 0;

void setup () {
  size(1920, 1080);
  background(0); //Black background, can be changed to any color
  
  myPlayer = new Player(INIT_PLAYER_X, INIT_PLAYER_Y, INIT_PLAYER_COLOUR, INIT_PLAYER_CIRCLE_RADIUS); //Instantiate myPlayer using the Player class and our previously defined constants.
  playerEnemies = new Enemy[0]; //Instantiate array of enemies
  playerBullets = new Bullet[0]; //Instantiate array of bullets
}

void draw () {
  background(0);
  
  //If the game is over, we don't draw our player, bullets and enemies, but only show a game over screen
  if (gameOver) {
    PFont gameOverFont = loadFont("SegoeUI-Bold-32.vlw");
    textFont(gameOverFont);
    textSize(32);
    text(GAME_OVER_TEXT, (SCREEN_WIDTH-textWidth(GAME_OVER_TEXT))/2, SCREEN_HEIGHT/2);
    text("Your score: " + playerScore, (SCREEN_WIDTH-textWidth(GAME_OVER_TEXT))/2, (SCREEN_HEIGHT/2)+50);
    fill (255);
  }
  
  //If the game is not over, we draw our game as normal
  else {
    
    // Drawing the score in the top-left corner. You can change the font, its size and its position
    PFont scoreFont = loadFont("SegoeUI-Bold-32.vlw");
    textFont(scoreFont);
    textSize(18);
    text("Score: " + playerScore, 20, 20);
    fill (255);
    
    myPlayer.draw(); // Calling the draw function from the Player class
  
    if(myPlayer.isOffScreen()) {
      gameOver = true; // If myPlayer goes off screen, the game is over
    }
  
    if ((int) random(ENEMY_FREQUENCY) == 20 && num_enemies < MAX_NUM_ENEMIES) { // Check that there are not too many enemies and they are not spawning too often
      Enemy newEnemy = new Enemy(SCREEN_WIDTH, (int) random(0, SCREEN_HEIGHT), ENEMY_RADIUS); //Create enemy
      playerEnemies = (Enemy[]) append(playerEnemies, newEnemy); //Add the enemy to the enemies array
      num_enemies ++;
    }
    
    int playerXPos = myPlayer.getXPos(); //Use the getter functions from the Player class
    int playerYPos = myPlayer.getYPos();

    if (keyPressed && myPlayer.timeSincePress > 30) { // To ensure that the player can't spawn 100s of bullets per second
      if (key == ' ') {
        Bullet newBullet = new Bullet(playerXPos, playerYPos); // Instantiate new bullet
        playerBullets = (Bullet[]) append(playerBullets, newBullet); // Add new bullet to bullets array
        myPlayer.timeSincePress = 0; // Must wait 30 more frames for next bullet
      }
    }
    
    if (playerBullets.length > 0) { //Prevent indexNotFound error
      for (int i = 0; i < playerBullets.length; i++) { //Iterate through each bullet in the array, draw the bullet and check if the bullet has collided with an enemy.
        playerBullets[i].draw();
        if (playerBullets[i].collide(playerEnemies)) {
          playerScore ++;
        }
      }
    }
  
    if (playerEnemies.length > 0) { //Prevent indexNotFound error
      for (int i = 0; i < num_enemies; i++) { // Iterate through each enemy in array, draw the enemy and check if the enemy collided with the player or is off screen
        playerEnemies[i].draw();
  
        if (playerEnemies[i].playerCollision(playerXPos, playerYPos, INIT_PLAYER_CIRCLE_RADIUS)) {
          gameOver = true; 
        }
      
        if (playerEnemies[i].isOffScreen()) {
          playerScore ++;
          playerEnemies[i].respawn(); // Respawn off screen enemies
        }
      }
    }
  }
}
