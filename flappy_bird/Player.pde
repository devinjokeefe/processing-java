class Player {

  //Important player variables
  
  int xPos;
  int yPos;
  color playerColour;
  int playerRadius;
  int playerScore = 0;
  int ySpeed = 0;
  int timeSincePress = 0;
  
  //Player constructor 
  Player(int initX, int initY, color initColour, int initRadius) {
    this.xPos = initX;
    this.yPos = initY;
    this.playerColour = initColour;
    this.playerRadius = initRadius;
  }
  
  void draw () {
    fill(playerColour);
    ellipse(xPos, yPos, playerRadius, playerRadius); // Create the player circle
    yPos += ySpeed; // Constantly moving by the amount of the ySpeed variable
    ySpeed ++; //Due to gravity, ySpeed is constantly increasing (i.e. circle going down)
    timeSincePress ++; //Timesincepress increases every frame
    
    if (mousePressed) {
      ySpeed = -20; //Like flappy bird, our circle goes up 20 pixels when pressed
    }
  }
  
  //Getting functions
  int getXPos () {
    return xPos; 
  }
  
  int getYPos () {
    return yPos; 
  }
  
  //Check if player is off screen
  boolean isOffScreen () {
    if (yPos < 0 || yPos > height) {
      return true;
    }
    
    else {
      return false; 
    }
  }
}
