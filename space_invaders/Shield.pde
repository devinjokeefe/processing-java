class Shield {
 /* declare variables for alien position, direction of movement and appearance */
 int x_pos; int y_pos;
 PImage classImage;
 PImage altImage;
 int imageWidth;
 int imageHeight;
 int shieldHealth = 100;
 
 Shield(int xpos, int ypos, PImage shieldImage){
  /* set up the new alien object */ 
  x_pos = xpos;
  y_pos = ypos;
  classImage = shieldImage;
  imageWidth = classImage.width;
  imageHeight = classImage.height;
  altImage = loadImage("shield_2.png");
 }
 
 int x () {
   return x_pos;
 }
 
 int y () {
   return y_pos;
 }
 
 boolean isHit (Bullet bulletHitting) {
   if (bulletHitting.x() >= x_pos && bulletHitting.x() <= x_pos + imageWidth) {
     if (bulletHitting.y() >= y_pos && bulletHitting.y() <= y_pos + imageHeight) {
       println(shieldHealth);
       return true;
     }
   }
   println(shieldHealth);
   return false;
 }
 
 boolean isHitByBomb (Bomb bombHitting) {
   if (bombHitting.x() >= x_pos && bombHitting.x() <= x_pos + imageWidth) {
     if (bombHitting.y() + bombHitting.bombImage.height >= y_pos && bombHitting.y() + bombHitting.bombImage.height<= y_pos + imageHeight) {
       println(shieldHealth);
       return true;
     }
   }
   println(shieldHealth);
   return false;
 }
 
 void draw(){
    if (shieldHealth > 50) {
      image(classImage, x_pos, y_pos);
    }
    
    else if (shieldHealth > 0){
      image(altImage, x_pos, y_pos);
    }
  }
}
