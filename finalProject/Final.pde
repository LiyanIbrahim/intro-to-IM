/*
This is my Intro to IM final project which, along with the physical prototype to provide a support study system. While this code can work along with the ardiuno code on any physical device hooked up. The certain physical prototype I have makes this more complete since it's design 
 is crucial in the understanding of how this support system works. 
 
 Done by: Liyan Ibrahim 
 
 */
//sound setup 
import processing.sound.*;
SoundFile soundfile;
SoundFile nap;
//serial monitor setup
import processing.serial.*;     // import the Processing serial library
Serial myPort;// The serial port
//global variables
int theme=0;
int start=0;
int startreadingvalues=0;
int toggleValue;
float inByte=0;
boolean playStudySong=false;
int startSTUDYMUSIC=0;
int startPHASE2=0;
int startPHASE3=0;
int startGAME=0;
float xpos, ypos;
float x1=10;
float y1=10;
float w1=10;
float h1=10;
int gameSit=0;
int score=0;
boolean napPlaying=false;
int idk=0;

//-------------------------------------------FOR THE GAME ----------------------------------------------------------
Dashes[] dashes = new Dashes[11];
Car enemyCar;
int userPOS=CENTER;
float p;
//dashes class which are just moving as decorative objects 
class Dashes {
  int tempx1;
  int tempx2;
  int tempy; 
  int tempS;
  Dashes(int x1, int x2, int y, int s) { //constructor 
    tempx1=x1;
    tempx2=x2;
    tempy=y;
    tempS=s;
  }
  //displays the dashes 
  void display() {
    fill(212, 190, 190);
    rect(tempx1, tempy, 10, 50);
    rect(tempx2, tempy, 10, 50);
  }
  //allows them to move by adding speed 
  void move() {
    if ( tempy < height + 50 ) {
      tempy += tempS;
    } else {
      tempy = - 50;
    }
  }
}
//Class car 
class Car {
  float tempx;
  int tempy;
  int tempC;
  int tempS;
  Car(float x, int y, int C, int S) {
    tempx=x;
    tempy=y;
    tempC=C;
    tempS=S;
  }
  //returns true if the car is on the left as defined by the value 
  boolean isLEFT() {
    return (tempx==64);
  }
  //returns true if the car is on the right as defined by the value 
  boolean isRIGHT() {
    return (tempx==315);
  }
  //returns true if the car is on the center as defined by the value 
  boolean isCent() {
    return (tempx==190);
  }
  //returns the value of y 
  int getY() {
    return tempy;
  }
  //displays the car 
  void display() {
    fill(160, 154, 188);
    rect(tempx, tempy, 100, 200);
  }
  //moves the car (upwards) 
  void move() {
    if (tempy<height+100) {
      tempy+=tempS;
    } else {
      tempy= -200;
      tempx=64;
    }
  }
}
//allows you to navigate the position of the car by using the keys 
void keyPressed() {
  int position = userPOS;
  if (position == CENTER && keyCode == LEFT) {
    userPOS = LEFT;
  } else if (position == CENTER && keyCode == RIGHT) {
    userPOS = RIGHT;
  } //if car left and left arrow pressed return false
  else if (position == LEFT && keyCode == RIGHT) {
    userPOS = CENTER;
  } //if car right and right arrow pressed return false
  else if (position == RIGHT && keyCode == LEFT) {
    userPOS = CENTER;
  }
}
//displays the car of the player
void userDisplay( int position) {
  if (position == LEFT) {
    fill(255);
    rect(64, 500, 100, 200); //car left
    fill(0);
    rect(190, 500, 100, 200);
    rect(315, 500, 100, 200);
  }
  if (position == RIGHT) {
    fill(255);
    rect(315, 500, 100, 200); //car right
    fill(0);
    rect(190, 500, 100, 200);
    rect(64, 500, 100, 200);
  }
  if (position == CENTER) {
    fill(255);
    rect(190, 500, 100, 200); //car top
    fill(0);
    rect(64, 500, 100, 200);
    rect(315, 500, 100, 200);
  }
  //displays dashes
  for (int i = 0; i < dashes.length; i++) {
    dashes[i].display();
    dashes[i].move();
  }
}
//checks for collisions 
boolean collided(int userPosition, Car enemyCar) {
  int enemyCarY = enemyCar.getY();

  if (enemyCarY < 500) {

    return false;// Car is too high to have collided
  }

  if (userPosition == LEFT && enemyCar.isLEFT()) {
    return true;
  } else if (userPosition == RIGHT && enemyCar.isRIGHT()) {
    return true;
  } else if (userPosition == CENTER && enemyCar.isCent()) {
    return true;
  }

  return false;
}

void setup() {
  size(900, 700);
  //setting up communications 
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  smooth();
  //setting up songs 
  soundfile = new SoundFile(this, "focus.mp3");
  nap=new SoundFile(this, "nap.mp3");
  //filling in array of dashes 
  for (int i = 0; i < dashes.length; i++) {
    dashes[i] = new Dashes(173, 296, i*69, 5);
  }
  //to pick a position for enemy car (and randomize it) 
  float r=random(0, 3);
  if (r==0) {
    p=64;
  } else if (r==1) {
    p=190;
  } else {
    p=315;
  }
  enemyCar = new Car( p, -200, 0, 4);
}
//plays the game 
void runGame() {
  background(0);//text for reference 
  PFont score1=createFont("monaco", 30);
  textFont(score1, 30);
  stroke(3, 3, 3);
  fill(212, 190, 190);
  textAlign(0, 0);
  text("Collisions:", 500, 500);
  PFont scoreValue=createFont("monaco", 30);
  textFont(scoreValue, 30);
  stroke(3, 3, 3);
  fill(212, 190, 190);
  textAlign(0, 0);
  text(score, 800, 500);
  //enemyCar = new Car( p, -200, 0, 4);
  //display users car 
  userDisplay(userPOS);
  if (score>600) {
    PFont warning=createFont("mocano", 30);
    textFont(warning, 30);
    stroke(3, 3, 3);
    fill(212, 190, 190);
    textAlign(0, 0);
    text("It's getting too high", 500, 700);
  }
  //Side Lines
  fill(255);
  rect(50, 0, 10, 700);
  rect(420, 0, 10, 700);
  fill(215, 209, 8);

  //Enemy Car
  enemyCar.display();
  enemyCar.move();

  //check for collisions and increase teh score of collisions as long as the car is colliding and display message 
  if (collided(userPOS, enemyCar)) {
    score+=1;
    fill(255, 255, 255);
    PFont collide=createFont("monaco", 30);
    textFont(collide, 30);
    stroke(3, 3, 3);
    fill(212, 190, 190);
    textAlign(0, 0);
    text("OH NO! Stop colliding to stop the increase", 500, 300);
  }
}

void draw() {
  //to navigate between the different screens, I used the concept of themes as I did in the midterm project 

  if (theme==0) {//starting theme 
    PImage main=loadImage("main.png");
    //nap.stop();
    image(main, 0, 0);
    // rect( 560, 280, 180, 130); //parameters for mouseclicked
  }
  if (mousePressed) { //if used presses the correct screen to initialize the program, move to theme 1 
    if (mouseX>560 && mouseX<740) {
      if (mouseY>280 &&mouseY<410) {
        theme=1;
        idk++;
      }
    }
  }
  //this is the navigation screen allowing the user to pick between the different modes 
  if (theme==1) {
    //nap.stop();
    soundfile.stop();
    PImage nav=loadImage("Navigation2.png");
    image(nav, 0, 0);
    backButton(0);
    start++;
    startreadingvalues++;
    //soundfile.stop();
    //startPHASE2=0;
  }
  if (theme==2) { //study mode (and so play study music 
    PImage study=loadImage("study.png");
    image(study, 0, 0);
    backButton(1);
    startPHASE2++;
    //user can pause the music using the toggle switch 
    if (toggleValue==0) { 
      if (!soundfile.isPlaying()) { //only play it if its not playing or it will make a crunchy sound 
        soundfile.loop(); //makes sure the song loops back when it finishes
      }
    }
    if (toggleValue==1) {
      soundfile.pause(); //pause
    }
  }
  if (theme==3) { //break theme 
    myPort.write('H'); //send H so LEDs can blink 
    napPlaying=false;
    nap.stop();
    if (nap.isPlaying()) { //if the nap song is playing, stop it 
      nap.stop();
    }
    PImage breaK=loadImage("break.png");
    image(breaK, 0, 0);
    backButton(1);
    startPHASE3++;
    soundfile.stop(); //stop the other sound track too
  }
  if (theme==4) { //nap theme 
    myPort.write('1'); //so yellow LED can blink 
    if (!nap.isPlaying()) { //if audio isnt playing, play song 
      nap.play();
    }

    PImage nap=loadImage("relax.png");
    image(nap, 0, 0);

    backButton(3);
  }
  if (theme==5) {//party theme 
    myPort.write('3'); //blink the pattern for the dance party 
    background(212, 190, 190);
    party();
    backButton(3);
  }
  if (theme==6) { //game theme 
    background(0, 0, 0); 
    myPort.write('2');
    runGame(); //run the game function in this theme 
    backButton(3);
  }
}
//used for debugging sound problems 
void songOptions(int value) {
  if (value==0) {
    soundfile.stop();
  }
  if (value==1) {
    soundfile.play();
    //soundfile.amp(0.5);
  }
}
//this button is present at the bottom of every theme to give the option to the user of going back 
void backButton(int th) { //takes the previuos theme that the user wants to go to 
  PImage back=loadImage("back.png");
  back.resize(100, 70);
  image(back, 0, 630);
  if (mousePressed) { //if user presses on the button, move to the previuos theme 
    if (mouseX>0 &&mouseX<100) {
      if (mouseY>630 && mouseY<700) {
        theme=th;
      }
    }
  }
}
//used in party function 
void drawEllipse(float x, float y) {
  noStroke();
  ellipse(x, y, 30, 30);
}
void party() { //party function that had ellipses drawn everwhere and randomly 
  for (int i=0; i<100; i++) {
    float x=random(width); // choose a random x coordinate 
    float y=random(height); //choose a random y coordinate 
    float colorOfEllipse=random(3);
    if (colorOfEllipse==1) {
      fill(160, 154, 188);
    } else if (colorOfEllipse==2) {
      fill(182, 166, 202);
    } else if (colorOfEllipse==3) {
      fill(225, 222, 233);
    }
    drawEllipse( x, y);
  }
}
//connection between arduino and processing 
void serialEvent(Serial myPort) {
  // read the serial buffer:
  if (start>0) {
    myPort.write('L');
    String myString = myPort.readStringUntil('\n');
    myString = trim(myString);
    int sensors[]=int(split(myString, ','));
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }
    println();
    if (sensors.length>1) {
      if (startreadingvalues>0) {
        //inByte = float(myString);
        // println(myString);
        startPHASE2=0;

        if (sensors[0]>=0 && sensors[0]<=10) { //(sensors[0]>230 && sensors[0]<=730
          theme=2;
        } else if (sensors[0]>10 && sensors[0]<=730 ) { //sensors[0]>=0 && sensors[0]<=230
          theme=1;
        } else {
          theme=3;
        }
        startreadingvalues=0;
      }
      if (startPHASE2>0) {
        theme=2;
        if (sensors[1]==1) {

          toggleValue=0;
        }  
        if (sensors[1]==0) {

          toggleValue=1;
        }

        startPHASE2=0;
      }
      playStudySong=false;
      if (startPHASE3>0) {

        if (sensors[2]==1) {
          myPort.write('1');
          theme=4; //nap
        }  
        if (sensors[3]==1) {

          myPort.write('2');
          theme=6;
        }
        if (sensors[4]==1) {

          myPort.write('3');
          theme=5;
        }
      }
    }
  }
}

//debugging code 
void game(float x1, float y1, float w1, float w2) {
  background(0, 0, 0);
  fill(225, 222, 233);
  //float x1=10;
  //float y1=10;
  //float w1=10;
  //float h1=10;
  // if (mousePressed) {
  // }  
  ellipse(x1, y1, 100, 100);
  fill(0, 0, 0);
  ellipse(x1, y1, w1, h1);
}
