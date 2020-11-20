final int SCREENX = 640;
final int SCREENY = 360;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 80;
final int MARGIN = 10;
final String CPU_LOSES = "You win! Game Over.";
final String PLAYER_LOSES = "You lose! Game Over.";

Player thePlayer;
Player theCPU;
Ball theBall;

void settings() {
  size(SCREENX, SCREENY);
}

void setup(){
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  theCPU = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(RADIUS);
}

void moveCPU (int cpuPACE) {
  if (theBall.x > theCPU.xpos+(PADDLEWIDTH/2)) theCPU.move(theCPU.xpos + cpuPACE);
  else theCPU.move(theCPU.xpos - cpuPACE);
}

void drawLives() {
  if (!theBall.gameOver) {
    String playerScore = "Player Lives: "+ thePlayer.livesLeft;
    String CPUScore = "CPU Lives: " + theCPU.livesLeft;
    PFont myFont = loadFont("MonotypeCorsiva-12.vlw");
    textFont(myFont);
    textSize(24);
    text(playerScore, SCREENX-textWidth(playerScore)-MARGIN, SCREENY-MARGIN-PADDLEHEIGHT);
    text(CPUScore, MARGIN, MARGIN+PADDLEHEIGHT);
    fill(255);
  }
}

void draw() {
  background(44, 62, 80);
  thePlayer.move(mouseX);
  moveCPU(2 + theBall.hits/20);
  theBall.move();
  theBall.reset();
  theBall.collide(theCPU);
  theBall.collide(thePlayer);
  theBall.wallCollision();
  drawLives();
  thePlayer.draw();
  theCPU.draw();
  theBall.draw();
}
