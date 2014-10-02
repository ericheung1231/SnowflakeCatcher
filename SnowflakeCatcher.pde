SnowFlake [] snow, farSnow;
int siz, fallSpeed;
void setup()
{
  frameRate(20);
  size(500,500);
  background(100);
  snow = new SnowFlake[500];
  for (int i=0; i< snow.length; i++)
  {
    snow[i] = new SnowFlake();
  }
  farSnow = new SnowFlake[700];
  for (int i=0; i< farSnow.length; i++)
  {
    farSnow[i] = new SnowFlake();
  }
}
void draw()
{
  for (int i = 0; i< farSnow.length; i++)
  {
    siz = (int)(Math.random()*3)+2;
    fallSpeed = 1;


    farSnow[i].erase();
    farSnow[i].lookDown();
    farSnow[i].wrap();
    farSnow[i].move();
    farSnow[i].show();
    
  }
  for (int i = 0; i< snow.length; i++)
  {
    siz = (int)(Math.random()*4)+5;
    fallSpeed = 2;


    snow[i].erase();
    snow[i].lookDown();
    snow[i].wrap();
    snow[i].move();
    snow[i].show();

  }
  noStroke();
  beginShape();
  curveVertex(0,450);
  curveVertex(0,450);
  curveVertex(200,430);
  curveVertex(350,480);
  curveVertex(500,470);
  curveVertex(500,500);
  curveVertex(0,500);
  curveVertex(0,450);
  endShape();
}
void mouseDragged()
{
  noStroke();
  if (mousePressed && (mouseButton == LEFT))
  {
    fill(255,255,254);
    ellipse(mouseX, mouseY,20,20);
  }
  if (mousePressed && (mouseButton == RIGHT))
  {
    fill(100);
    ellipse(mouseX, mouseY,40,40);
  }
}

class SnowFlake
{
  int myX, myY;
  boolean isMoving;
  SnowFlake()
  {
    myX= (int)(Math.random()*500)+1;
    myY = (int)(Math.random()*500);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    stroke(100);
    ellipse(myX,myY,siz,siz);
  }
  void lookDown()
  {
    if (get (myX,myY+siz+2) == color(255,255,254))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;
    }
  }
  void erase()
  {
    fill(100);
    noStroke();
    ellipse(myX,myY,siz+3,siz+3);
  }
  void move()
  {
    if (isMoving == true)
    {
      myY+=fallSpeed; 
    }
  }
  void wrap()
  {
    if (myY>500-siz*2)
    {
    myX = (int)(Math.random()*500)+1;
    myY = (int)(Math.random()*-250);
    }
  }
}


