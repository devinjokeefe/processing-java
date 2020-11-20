final float BOMB_SPEED = 1;

class Bomb {
  int x_pos; 
  int y_pos;
  PImage bombImage;

  Bomb(int x, int y) {
    x_pos = x;
    y_pos = y;
    bombImage = loadImage("Bomb.png");
  }

  int x () {
    return x_pos;
  }
  
  int y () {
    return y_pos;
  }

  void move () {
    y_pos += BOMB_SPEED;
  }

  void draw () {
    image(bombImage, x_pos, y_pos);
  }

  boolean offScreen () {
    if (y_pos >= SCREEN_Y) {
      return true;
    }
    
    else {
      return false;
    }
  }
  
  boolean collide (Player thePlayer) {
    if (x_pos >= thePlayer.x()-50 && x_pos <= thePlayer.x() + PADDLEWIDTH) {
      if (y_pos >= thePlayer.y()-45 && y_pos <= thePlayer.y() + PADDLEHEIGHT) {
        return true;
      }
    }
    return false;
  }
}
