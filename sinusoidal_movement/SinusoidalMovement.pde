float i; float j;
int a; int b;
int c; int iterator;

void setup () {
  size (540, 540);
  background (0);
  noStroke ();
  i = 100;
  j = 150;
}

void draw () {
  background(0);
  frameRate(60);
  color colorOne = color(52, 152, c);
  color colorTwo = color(52, 152, c);
  fill (colorOne); rect (a, 270 + sin(i)*60, 20, 20);
  fill (colorOne); rect (a+539, 270 + sin(i)*60, 20, 20);
  fill (colorTwo); rect (b, 270 + sin(j)*60, 20, 20);
  fill (colorTwo); rect (b-539, 270 + sin(j)*60, 20, 20);
  
  a-=5;
  b+=5;
  c+=iterator;
  
  if (a <= -20) a = 519;
  if (b >= 539) b = 0;
  if (c >= 255) iterator = -1;
  if (c <= 0) iterator = 1;
  
  i-=0.1;
  j+=0.1;
  
}
