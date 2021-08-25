// ROTATING SQUARE with accurate wall collisions

// declare global variables for moving squares
float x, y, w;
float spdX, spdY, theta, rotSpd;

// enables accurate wall collisions
float cornerRadiusOffset, dynamicRadius, collisionTheta;

void setup()
{
  size(600, 600);
  x = width/2;
  y = height/2;
  w = 150;
  spdX = 2.1;
  spdY = 1.5;
  rotSpd = PI/180;
  fill(0, 175, 175);
  noStroke();
}

void draw()
{
  background(255, 127, 0);
  pushMatrix();
  translate(x, y);
  rotate(theta);
  rect(-w/2, -w/2, w, w);
  popMatrix();

  x+= spdX;
  y+= spdY;
  theta+= rotSpd;  

  // check for wall collisions
  collide();
}

void collide()
{
  // calculate dynamicRadius for more accurate wall collisions
  cornerRadiusOffset = w/2/cos(PI/4) - w/2; // calc difference between corner and side
  dynamicRadius = abs(sin(collisionTheta)*cornerRadiusOffset);
  
  if (x > width-w/2-dynamicRadius) // nabrak ke tembok kanan
  {
    spdX *= -1;
    rotSpd *= -1;
  } else if (x < w/2 + dynamicRadius) // nabrak ke tembok kiri
  {
    spdX *= -1;
    rotSpd *= -1;
  }
  
  if (y > height-w/2-dynamicRadius)
  {
    spdY *= -1;
    rotSpd *= -1;
  } else if (y<w/2 + dynamicRadius)
  {
    spdY *= -1;
    rotSpd *= -1;
  }
  
  // used to calculate dynamicRadius
  collisionTheta += rotSpd*2;
}
