final int SCREEN_X = 640;
final int SCREEN_Y = 480;
final int EXPLOSION_RARITY = 500;
final int PADDLEWIDTH = 60;
final int PADDLEHEIGHT = 20;
final int MARGIN = 15;
final int BOMB_DROP_RARITY = 200;
final int NUM_ALIENS = 10;
final String END_TEXT = "Game over!";
final int NUM_SHIELDS = 5;

Alien myAliens[];
Bullet playerBullets[];
Bomb myBombs[];
Shield myShields[];

void settings() {
  size(SCREEN_X, SCREEN_Y); 
}

Player thePlayer;
Bomb theBomb;
boolean gameOver;

void setup() {
  gameOver = false;
  int initX = 480;
  int initY = 50;
  PImage alienImage = loadImage("spacer.gif");
  PImage explodeImage = loadImage("exploding.gif");
  PImage shieldImage = loadImage("shield.png");
  
  myAliens = new Alien[NUM_ALIENS];
  myShields = new Shield[NUM_SHIELDS];
  
  for (int i=0; i<NUM_ALIENS; i++) { 
    myAliens[i] = new Alien(initX-50*i, initY, alienImage, explodeImage);
  }
  
  for (int i=0; i<NUM_SHIELDS; i++) {
    myShields[i] = new Shield(60+i*110, 300, shieldImage);
    println("SHIELD");
  }
  
  playerBullets = new Bullet[0];
  myBombs = new Bomb[NUM_ALIENS];
  
  thePlayer = new Player();
}

void draw() {
  background(62, 44, 80);
  boolean allAliensDead = true;
  
  for (int i=0; i<myAliens.length; i++) {
    if (myAliens[i].timeExploded < 50 && !gameOver && myAliens[i] != null) {
      allAliensDead = false;
      myAliens[i].move();
      myAliens[i].draw();
      if (!myAliens[i].bombDropped() && int(random(BOMB_DROP_RARITY)) == 20) {
        Bomb bombToAdd = new Bomb(myAliens[i].x(), myAliens[i].y()+MARGIN);
        myBombs[i] = bombToAdd;
        myAliens[i].hasDroppedBomb = true;
      }
      
      if (myBombs[i]!= null) {
        if (myBombs[i].offScreen()) myAliens[i].hasDroppedBomb = false;
      }
    }
  }
  
  if (allAliensDead) gameOver = true;
  
  for (int i=0; i<myShields.length; i++) {
    if (myShields[i] != null) {
      myShields[i].draw();
      for (int j=0; j<playerBullets.length; j++) {
        if (myShields[i].isHit(playerBullets[j])) {
          myShields[i].shieldHealth -= 10;
          if (myShields[i].shieldHealth > 0) playerBullets[j].y_pos = 0;
        }
      }
      for (int j=0; j<myBombs.length; j++) {
        if (myBombs[j] != null) {
          if (myShields[i].isHitByBomb(myBombs[j])) {
            myShields[i].shieldHealth -= 10;
            if (myShields[i].shieldHealth > 0) myBombs[j].y_pos = SCREEN_Y;
          }
        }
      }
    }
  }
  
  thePlayer.move(mouseX);
  if (!gameOver) thePlayer.draw();
  
  if (myBombs.length > 0 && !gameOver) {
    for (int i=0; i<myBombs.length; i++) {
      if (myBombs[i] != null) {
        if (myBombs[i].collide(thePlayer)) {
          gameOver = true;
        }
        myBombs[i].move();
        myBombs[i].draw();
      }
    }
  }
  
  if (mousePressed && thePlayer.timeSincePress > 50 && !gameOver) {
    Bullet bulletToAdd = new Bullet(mouseX+PADDLEWIDTH/2, SCREEN_Y-MARGIN-PADDLEHEIGHT-18);
    playerBullets = (Bullet[]) append(playerBullets, bulletToAdd);
    thePlayer.timeSincePress = 0;
  }
  
  if (playerBullets.length > 0 && !gameOver) {
    for (int i=0; i<playerBullets.length; i++) {
      if (playerBullets[i].y_pos > 0 && playerBullets[i] != null) {
        playerBullets[i].move();
        playerBullets[i].draw();
        playerBullets[i].collide(myAliens);
      }
    }
  }
  
  
  if (gameOver) {
    println("GAME OVER");
    PFont myFont = loadFont("MonotypeCorsiva-30.vlw");
    textFont(myFont);
    textSize(48);
    text(END_TEXT, (SCREEN_X-textWidth(END_TEXT))/2, SCREEN_Y/2);
    fill(255);
  }
}
