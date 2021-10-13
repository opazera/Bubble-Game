class Bubble {
  float x=random(width), y=height, w, bubsize, speedy, r, g, b,mover;

  Bubble(float tempX,float tempY, float tempW,  float tempspeedy,float tempr,float tempg,float tempb) {
    x = tempX;
    y= tempY;
    w = tempW;
    r= tempr;
    g=tempg;
    b=tempb;
    speedy= tempspeedy;
  }
  void display() {
    //display bubble 
    noFill();
    stroke(r, g, b);
    circle(x, y, w);
  }
  void move() {
    //equations for buble to move
 mover=speedy+score;
 mover=constrain(mover,1,200);
    y-=mover;
    x=x+random(-1, 1);
  }
  void burst() {
    //what happens to bubble when popped
    y=height+(random(10,100));
  }
void randobubb(){
  r=random(255);
  g=random(255);
  b=random(255);
  
  
}

//burst conditions for bubble
  boolean mouseBurst() {
    if (mouseX<x+w&&mouseX>x-w&&mouseY<y+w&&mouseY>y-w&&mousePressed) {
       x=random(width);
      return true;
    } else {
      return false;
    }
  }
  //function for when bubble reaches top
  boolean reachedTop() {
    if (y<0) {
      y=height+(random(10,100));
      x=random(width);
      return true;
    } else {
      return false;
    }
  }
  
}
