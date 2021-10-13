//variables for different levels and score
boolean pg1=false;
boolean pg2=false;
int score=0;
//class variable
Bubble[] bubb=new Bubble[10];


void setup() {
  //setting the size and the for loop for object to repeat
  size(700, 700);
   for (int b=0; b<bubb.length; b++) {
  bubb[b] = new Bubble(random(width),height+random(10,100), random(30, 80), random(1, 2),random(255),random(255),random(255));
   }

}


void draw() {
  //exit page
if(pg2==true){
  exit();
}
//intro page
  if (pg1||pg2==false) {
    Intro();
  }
  //loop for background
  if (pg1) {
    background(255);
    for(int m=0;m<=100;m+=1){
         //makes the colors random
         fill(random(255),random(255),random(255),100);
         //makes them in random location but all the same size 
         rect(random(width),random(height),10,10);

    }
    //condtion with the bubble class functions
    for (int b=0; b<bubb.length; b++) {
    bubb[b].display();
    bubb[b].move();
    if (bubb[b].reachedTop()) {
      score-=1;
    } else if (bubb[b].mouseBurst()) {
      score+=1;
      bubb[b].burst();
    }
    }
    displayscore();
  }
}
//intro page function
void Intro() {
  float x=100;
  float y=height-70;
  float size=100;
  float bsize=size/2;
  float x2= width-100;
  float y2= height-70;

  rectMode(CENTER);
  background(0);
  fill(255);
  rect(x, y, size, size);
  rect(x2, y2, size, size);
  fill(255, 0, 0);
  textSize(40);
  textAlign(CORNER);
  text("Start", x-45, y);
  text("Exit", x2-35, y2);
  textAlign(CENTER);
  textSize(width/40);
  text("Goal is to get the highest score possible by ", width/2, 100);
  text("clicking the bubbles before they reached the top", width/2, 120);
 //buttons
  if (mousePressed) {
    if (mouseX>x-bsize&&mouseX<x+bsize&&mouseY>y-bsize&&mouseY<y+bsize) {
      pg1=true;
    }
    if (mousePressed) {
      if (mouseX>x2-bsize&&mouseX<x2+bsize&&mouseY>y-bsize&&mouseY<y+bsize) {
        pg2=true;
      
      }
    }
  }
}





void displayscore() {
  //score board
  fill(0);
  textSize(width/30);
  text(score, 130, 50);
  text("Points", 50, 50);
}
