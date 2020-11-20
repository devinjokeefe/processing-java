final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int SPEED = 3;

class Alien {
 /* declare variables for alien position, direction of movement and appearance */
 int x_pos; int y_pos;
 PImage classImage;
 PImage explosionImage;
 int imageWidth;
 int imageHeight;
 int timeExploded;
 boolean hasDroppedBomb = false;
 
 int x_direction = SPEED; //1 = right; -1 = left; 0 = down;
 int y_direction = 0; //0 = right/left; -1 = down;
 int y_dist_moved = 0;
 
 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int xpos, int ypos, PImage alienImage, PImage explodeImage){
  /* set up the new alien object */ 
  x_pos = xpos;
  y_pos = ypos;
  classImage = alienImage;
  explosionImage = explodeImage;
  imageWidth = classImage.width;
  imageHeight = classImage.height;
 }
 
 boolean bombDropped () {
   return hasDroppedBomb;
 }
  
 void move(){
  /* Move the alien according to the instructions in the exercise */
  if (x_pos >= SCREEN_X-imageWidth && x_direction == SPEED) {
    x_direction = 0;
    y_direction = SPEED;
    y_dist_moved = 0;
  }
  
  else if (x_pos <= 0 && x_direction == -SPEED) {
    x_direction = 0;
    y_direction = SPEED;
    y_dist_moved = 0;
  }
  
  if (y_dist_moved >= imageHeight) {
    y_direction = 0;
    if (x_pos >= SCREEN_X-imageWidth) x_direction = -SPEED;
    if (x_pos <= 0) x_direction = SPEED;
  }
  
  x_pos += x_direction;
  y_pos += y_direction;
  y_dist_moved += y_direction;
  
  
 }
 
 int x () {
   return x_pos;
 }
 
 int y () {
   return y_pos;
 }
 
 void explode() {
     classImage = explosionImage;
 }
  
  void draw(){
    /* Draw the alien using the image() method demonstrated in class */
    image(classImage, x_pos, y_pos);
    if (classImage == explosionImage) timeExploded ++;
  }
}
