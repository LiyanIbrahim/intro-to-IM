//This code goes with the arduino code and hardware for my memory game 
//Liyan Ibrahim 

import processing.serial.*;     // import the Processing serial library
Serial myPort;                  // The serial port
//images used in the game
PImage backgroundScene1;
PImage t1;
PImage t2;
PImage game;
PImage Scene2;
PImage Scene3;
PImage Scene4;
//global variables 
int start=0;
int moveTo2=0;
int moveTo3=0;
int stopPattern=0;
int tranisiton1=0;
int tranisiton2=0;
int gamedone=0;
//internal timers for transition images 
int x=0;
int x2=0;
void setup() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[3], 9600);
  myPort.bufferUntil('\n');
  size(700, 700);
}

void draw() {
  scene1(); //display scene 1 until the mouse is pressed 
  if (mousePressed) {
    start++; //incrementing start will move the image to scene 2 but will also allow the first pattern to play in arduino
  }
  if (start>0) {
    scene2();
  }
  if (tranisiton1>0&&x>3) {
    t1=loadImage("T1.jpg");
    image(t1, 0, 0);
  }
  if (moveTo2>0) {
    scene3();
  }
  if (tranisiton1>0&& x2>9) {
    t2=loadImage("T2.jpg");
    image(t2, 0, 0);
  }
  if (moveTo3>0) {
    GameOver();
  }
  //check if they pressed the button 
  //got to scene 2
}
//main page 
void scene1() {
  backgroundScene1=loadImage("back.jpg");
  image(backgroundScene1, 0, 0);
  PFont intro = createFont("monaco", 40);
  textFont(intro, 40);
  color myFavoriteColor =color(240, 248, 255);

  fill(myFavoriteColor);
  textAlign(CENTER);
  text("Memory Game Using LED's", width/2-60, height/2);
  fill(0, 0, 255);
  ellipse(width/2+50, height/2 +50, 50, 50);
  fill(0, 255, 0);
  ellipse(width/2 -150, height/2 +50, 50, 50);
  fill(255, 0, 0);
  ellipse(width/2 +150, height/2 +50, 50, 50);
  fill(255, 0, 0);
  ellipse(width/2 -250, height/2 +50, 50, 50);
}
void scene2() { //round 1 
  Scene2=loadImage("round1.jpg");
  image(Scene2, 0, 0);
}
void scene3() { //round 2
  Scene3=loadImage("round2.jpg");
  image(Scene3, 0, 0);
}
void GameOver() { //game over scene 
  game=loadImage("gameover.jpg");
  image(game, 0, 0);
}

void serialEvent(Serial myPort) {
  if (start>0 ) { //if mouse is pressed, start will be incremented and therefore, L will be sent and so pattern one starts 
    println("Sending Inbyte");
    myPort.write('L');
    //internal timer
    tranisiton1++;
    x++;
  }
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  // if you got any bytes other than the linefeed:
  myString = trim(myString);
  int buttons[] = int(split(myString, ','));
  // print out the values you got:
  for (int buttonsNum = 0; buttonsNum < buttons.length; buttonsNum++) {
    print("Sensor " + buttonsNum + ": " + buttons[buttonsNum] + "\t");
  }
  // add a linefeed after all the sensor values are printed:
  println();
  if (buttons.length > 1) {
    //if the correct value is pressed (blue button) move to scene 2
    if (buttons[0]== 1 && buttons[1]== 0 && buttons[2]== 0) {
      println("done");
      moveTo2++;
    } else if (buttons[1]== 1 || buttons[2]== 1) { //otherwise, make all the lights blink 
      myPort.write(1);
    }
  }
  //if user guesses correctly, and therefore, moveTo2 is incremented 
  if (moveTo2>0) {
    println("sending second");
    myPort.write('H'); //play the second pattern 
    //internal timer (I feel like we can get rid of one since they're the same) but since it is working I kept it like that
    tranisiton2++;
    x2++;
    if (buttons.length > 1) {  //this if statement is inside the bigger if statement because when it wasnt, it messed up the options when pattern 1 is played so I needed to inclose it in another if statement  
      //if correct option is picked, moveTo3 is incremented 
      if (buttons[2]== 1 && buttons[0]== 0 && buttons[1]== 0) {
        println("done");
        moveTo3++;
      } else if (buttons[0]== 1 || buttons[1]==1) { //if not the correct option, blink all of the LEDs (this is delayed, I think because of the nested if statements) 
        myPort.write(1);
      }
    }
  }
}
