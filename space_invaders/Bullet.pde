final int BULLET_SPEED = 3;

class Bullet {
  int x_pos; 
  int y_pos;
  PImage bulletImage;

  Bullet(int x, int y) {
    x_pos = x;
    y_pos = y;
    bulletImage = loadImage("Bullet.png");
  }
  
  int x () {
    return x_pos;
  }
  
  int y () {
    return y_pos;
  }

  void move () {
    y_pos -= BULLET_SPEED;
  }

  void draw () {
    image(bulletImage, x_pos, y_pos);
  }

  void collide(Alien[] myAliens) {
    int alienWidth = myAliens[0].imageWidth;
    int alienHeight = myAliens[0].imageHeight;
    
    for (int i=0; i<myAliens.length; i++) {
      if (myAliens[i].x_pos <= x_pos && myAliens[i].x_pos + alienWidth >= x_pos) { 
        if (myAliens[i].y_pos <= y_pos && myAliens[i].y_pos + alienHeight >= y_pos) { 
          myAliens[i].explode();
        }
      }
    }
  }
}
