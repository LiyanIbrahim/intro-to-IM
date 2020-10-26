// Memory card game using themes 
// Liyan Ibrahim, Oct 27 2020 
// Check out the Github repo for my Journey!! 

import processing.sound.*;
SoundFile song;
String starting="Come on, we're ready for you"; // I use this string to print out later on 
String second="One more to go!"; // I use this string to print out later on 
int theme; // navigate between the screens 

//TV show initailization --> says movie but is actually tv show, checkout the class or my github documentation
MovieCards[] cards=new MovieCards[6]; // array of 6 cards of type movieCards 
int[] x= new int[6]; //array of the 6 x positions 
int[] y= new int[6]; //array of their 6 y positions 
int [] ind=new int [6]; // which position they are in the array (what card will display when user clicks) 
int flipped=0; // increment everytime one card is facing up 
int[] cardIndex=new int[6]; // for when the cards flip and I need to compare them 
int widthOfCards=200; // width of card which will be referenced later 
int score=0; // for displaying score for this theme
int[] cardFlipped =new int[2]; // stored the i for the card flipped 
boolean[] clicked=new boolean[6]; // is true when the card is clicked (and flipped), prevents user from clicking the same card again 

//Band theme initialization 
BandCards[] cards1=new BandCards[6]; // array of 6 cards of type movieCards 
int[] x1= new int[6]; //array of the 6 x positions 
int[] y1= new int[6]; //array of their 6 y positions 
int [] ind1=new int [6]; // which position they are in the array (what card will display when user clicks) 
int flipped1=0; // increment everytime one card is facing up 
int[] cardIndex1=new int[6];// for when the cards flip and I need to compare them
int scoreNEW=0; // for displaying score
int[] cardFlipped1 =new int[2];// stored the i for the card flipped 
boolean[] clicked1=new boolean[6]; // is true when the card is clicked (and flipped), prevents user from clicking the same card again

//Movie initialization  
TvCards[] cards2=new TvCards[6]; // array of 6 cards of type movieCards 
int[] x2= new int[6]; //array of the 6 x positions 
int[] y2= new int[6]; //array of their 6 y positions 
int [] ind2=new int [6]; // which position they are in the array (what card will display when user clicks) 
int flipped2=0; // increment everytime one card is facing up 
int[] cardIndex2=new int[6];// for when the cards flip and I need to compare them
int scoreNEW2=0; // for displaying score
int[] cardFlipped2 =new int[2];// stored the i for the card flipped 
boolean[] clicked2=new boolean[6];// is true when the card is clicked (and flipped), prevents user from clicking the same card again

void setup() {
  //put background that promtes user 
  theme=0;
  size(850, 700);
  int xValue=20; // first card x value (the rest will depend on them. 
  int yValue=30; // first card y value (the rest will also depend on them. 
  //int indexx=0; // might be useful later 
  // for all 6 positions and cards, this loop makes sure the cards are placed properly for all three themes 
  for (int i=0; i<6; i++) {
    //clicked[i]=false;
    y[i]=yValue; 
    x[i]=xValue;
    ind[i]=i+1;// first card is the back image 
    y1[i]=yValue; 
    x1[i]=xValue;
    ind1[i]=i+1;// first card is the back image 
    y2[i]=yValue; 
    x2[i]=xValue;
    ind2[i]=i+1;// first card is the back image 
    if (xValue < (widthOfCards+15*3)) {
      xValue+=(widthOfCards+15); // 15 pixel space between them
    } else if (xValue > (widthOfCards+15*3)) //move to a new line 
    {
      xValue=20;
      yValue+=250;
    }
  }
  // create the array of objects for each theme 
  for (int i=0; i<6; i++) {
    cards[i]= new MovieCards ( x[i], y[i], ind[i]);
  }
  for (int i=0; i<6; i++) {
    cards1[i]= new BandCards( x1[i], y1[i], ind1[i]);
  }
  for (int i=0; i<6; i++) {
    cards2[i]= new TvCards( x2[i], y2[i], ind2[i]);
  }
  //play sound file 
  song = new SoundFile(this, "melodyloops-season-of-joy.mp3");
}

void draw()
{
  //theme 0 is the main page which does NOT play music 
  if (theme==0) {
    mainMenu();
    song.stop();
  }
  // picking themes by pressing on the cursor of each theme respectivley and play music once in the theme
  if (mousePressed==true) {
    if ( mouseX>800 && mouseX<900) { //if ur in the correct region for choosing
      if (mouseY<78 &&mouseY>30) {
        println("IN if statement");
        theme=1;
        song.play();
        song.amp(0.5);
      }
      if (mouseY<310 &&mouseY>260) {
        println("IN if statement");
        song.play();
        song.amp(0.5);
        theme=2;
      }
      if (mouseY<590 &&mouseY>500) {
        song.play();
        song.amp(0.5);
        println("IN if statement");
        theme=3;
      }
    }
  }
  // display screen for each theme 
  if (theme==1) {
    moviesScreen();
  }
  if (theme==2) {
    bandsScreen();
  }
  if (theme==3) {
    tvShowsScreen();
  }
  //used in reseting the game 
  if (score==3 ||scoreNEW==3 || scoreNEW2==3) {
    gameOver();
    if (keyPressed==true) {
      if (key==' ') {
        theme=0;
      }
    }
  }
}


// FUNCTIONS USED

// sets background to black once inside each them
void backGround() { 
  background(0, 0, 0);
}
// sets the cursor image to click each theme and takes the x and y postions for it 
void clickMEbutton(int xVal, int yVal) {
  PImage clickHERE=loadImage("cursor .png");
  clickHERE.resize(50, 50); 
  image(clickHERE, xVal, yVal);
}
//Back button 
void backButton() {
  PImage back=loadImage("backbutton.png");
  back.resize(100, 40);
  image(back, 0, 600);
  //fill(255, 255, 255);
  //rect(0, 600, 40, 40);
  if (mousePressed==true) {
    if (mouseX>0 && mouseX<100 &&mouseY>600&& mouseY<640) {
      theme=0;
    }
  }
}
//creats the gameOver page 
void gameOver() {
  song.stop(); // stops song 
  PImage gameOver=loadImage("backK.png");
  gameOver.resize(width, height);
  image(gameOver, 0, 0);
  fill(245, 138, 32);
  ellipse((width/2), (height/2), 200, 200);
  PFont text1=createFont("monaco", 12);
  textFont(text1, 40);
  fill(255, 94, 25);
  //textAlign(90, 64);
  text("Press", (width/2)-70, (height/2)-110);
  PFont text2=createFont("monaco", 12);
  textFont(text2, 30);
  fill(255, 255, 255);
  //textAlign(90, 64);
  text("SPACE BAR", (width/2)-80, (height/2)+10);
  PFont text3=createFont("monaco", 12);
  textFont(text3, 40);
  fill(255, 94, 25);
  //textAlign(90, 64);
  text("to replay", (width/2)-95, (height/2)+130);
}
// main menu page 
void mainMenu() {
  //loads image for the main menu 
  PImage mainMenu=loadImage("mainMenu.png");
  //mainMenu.resize(700,500);
  image(mainMenu, 0, 0);
  //click me button 
  clickMEbutton(800, 30); //tv 
  clickMEbutton(800, 260); //band 
  clickMEbutton(800, 520); //tv
  //resets all scores and resets game --> used here since I want it to reset when I click the back button too 
  score=0;
  scoreNEW=0;
  scoreNEW2=0;
  for (int i=0; i<6; i++) {
    cards[i].reset();
    cards1[i].reset();
    cards2[i].reset();
    clicked1[i]=false;
    clicked2[i]=false;
    clicked[i]=false;
  }
  flipped=0;
  flipped1=0;
  flipped2=0;
}


// game when the user presses on TV theme screen 
void moviesScreen() {
  backGround();//put background image 
  //for every card (in this case we have 6 
  for (int i=0; i<6; i++) {
    cards[i].place(); // display them using an inclass function
  }
  backButton(); // add the back button
  flip(); // call the flip function --> for when the cards dont match 
  PFont enc=createFont("monaco", 30); // use the encouraging texts 
  textFont(enc, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  if (score==0) {
    text(starting, 200, 630);
  }
  if (score==2) {
    text(second, 200, 630);
  }
  // to display the score 
  PFont score1=createFont("monaco", 30);
  textFont(score1, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text("SCORE:", 270, 259);
  PFont scoreValue=createFont("monaco", 30);
  textFont(scoreValue, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text(score, 380, 259);
  //if user presses on one of the cards call the flipCard function 
  if (mousePressed==true) {
    // if (flipped<4) { //only flip if you have less than 2 cards flipped --> idk why 4 works 
    flipCARD();
  }
  // }
}

//game when the user presses on band screen --> same as TV screen 
void bandsScreen() {
  backGround();//put background image 
  //for every card (in this case we have 6 
  for (int i=0; i<6; i++) {
    cards1[i].place(); // display them using an inclass function
  }
  backButton(); // add the back button
  flip2();
  PFont enc=createFont("monaco", 30);
  textFont(enc, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  if (scoreNEW==0) {
    text(starting, 200, 630);
  }
  if (scoreNEW==2) {
    text(second, 200, 630);
  }
  PFont score2=createFont("monaco", 30);
  textFont(score2, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text("SCORE:", 270, 259);
  PFont scoreValue2=createFont("monaco", 30);
  textFont(scoreValue2, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text(scoreNEW, 380, 259);
  if (mousePressed==true) {
    // if (flipped<4) { //only flip if you have less than 2 cards flipped --> idk why 4 works 
    flipCARD2();
    //check if they are the same
    //}
  }
}

//game when the user presses on movie show screen --> same as the movies 
void tvShowsScreen() {
  backGround();//put background image 
  //for every card (in this case we have 6 
  for (int i=0; i<6; i++) {
    cards2[i].place(); // display them using an inclass function
  }
  backButton(); // add the back button
  flip3();
  PFont enc=createFont("monaco", 30);
  textFont(enc, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  if (scoreNEW2==0) {
    text(starting, 200, 630);
  }
  if (scoreNEW2==2) {
    text(second, 200, 630);
  }
  PFont score3=createFont("monaco", 30);
  textFont(score3, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text("SCORE:", 270, 259);
  PFont scoreValue3=createFont("monaco", 30);
  textFont(scoreValue3, 30);
  stroke(3, 3, 3);
  fill(245, 138, 32);
  textAlign(0, 0);
  text(scoreNEW2, 380, 259);
  //flip button 
  //PImage flip=loadImage("cursor .png");
  //image(flip,220,560);

  if (mousePressed==true) {
    // if (flipped<4) { //only flip if you have less than 2 cards flipped --> idk why 4 works 
    flipCARD3();
    //check if they are the same
    //}
  }
}

//function for fliping the card for TV screen
void flipCARD() {
  // for every card, if you press on it go into the if statement 
  for (int i=0; i<6; i++) {
    if (mouseX>x[i] && mouseX<(x[i]+(widthOfCards+15*3)) && mouseY>y[i] && mouseY<(y[i]+(widthOfCards+15)) && clicked[i]==false &&flipped<2) {
      cards[i].flip(); // flip the card pressed on 
      clicked[i]=true; // set it as true since it is clicked on and to prevent teh second card clicked on being the same one 
      cardIndex[flipped]=i; // store i as the first or second postion in the index (depends on if you click it as the first card or the second card)
      cardFlipped[flipped]=i; //store i as the first or second postion in the index (depends on if you click it as the first card or the second card)
      flipped++; // increment flipped 
      println(flipped);
      if (flipped==2) { // if you flipped 2 cards 
        println("flipped more than 2 cards");
        // to prevent out of range error
        if (cardIndex[1]==5 ||cardIndex[0]==5) {  
          if (cardIndex[1]==5) {
            ind[cardIndex[1]] =3;
          } else if (cardIndex[0]==5) {
            ind[cardIndex[0]] =3;
          }
        }
        println(ind[cardFlipped[0]], ind[cardFlipped[1]]);
        println(ind[cardIndex[0]], ind[cardIndex[1]]);
        println(cardIndex[0], cardIndex[1]);
        // if cards are the same 
        if (cards[ind[cardIndex[0]]].movie(ind[cardIndex[0]])==cards[ind[cardIndex[1]]].movie(ind[cardIndex[1]])) {
          score++; // increase user score 
          println(ind[cardIndex[0]], ind[cardIndex[1]]);
          println(score);
          println("cards match");
          // call the matched function so it displays matched image on both cards 
          cards[cardFlipped[0]].cardisMatched();  
          cards[cardFlipped[1]].cardisMatched();
          flipped=0; // set flipped back to 0 so you can play again 
        }
      }
    }
  }
}

// repeat the same logic for the Bands theme 
void flipCARD2() {

  for (int i=0; i<6; i++) {
    if (mouseX>x1[i] && mouseX<(x1[i]+(widthOfCards+15*3)) && mouseY>y1[i] && mouseY<(y1[i]+(widthOfCards+15)) && clicked1[i]==false && flipped1<2) {
      cards1[i].flip();
      clicked1[i]=true;
      cardIndex1[flipped1]=i;
      cardFlipped1[flipped1]=i;
      flipped1++;
      println(flipped1);
      //delay(1000);
      if (flipped1==2) {
        println("flipped more than 2 cards");
        // flipped1=0;
        if (cardIndex1[1]==5 ||cardIndex1[0]==5) { // to prevent out of range error 
          if (cardIndex1[1]==5) {
            ind1[cardIndex1[1]] =1;
          } else if (cardIndex1[0]==5) {
            ind1[cardIndex1[0]] =1;
          }
        }
        println(ind1[cardIndex1[0]], ind1[cardIndex1[1]]);
        println(cardIndex1[0], cardIndex1[1]);

        if (cards1[ind1[cardIndex1[0]]].movie(ind1[cardIndex1[0]])==cards1[ind1[cardIndex1[1]]].movie(ind1[cardIndex1[1]])) {
          scoreNEW++; // increase user score 
          //background(0,0,0); checking if my  if statement works 
          println(score);
          println("cards match");
          cards1[cardFlipped1[0]].cardisMatched();
          cards1[cardFlipped1[1]].cardisMatched();
          flipped1=0;
        }
      }
    }
  }
}

// repeat the same logic for the movies theme 
void flipCARD3() {
  for (int i=0; i<6; i++) {
    if (mouseX>x2[i] && mouseX<(x2[i]+(widthOfCards+15*3)) && mouseY>y2[i] && mouseY<(y2[i]+(widthOfCards+15)) && clicked2[i]==false && flipped2<2) {
      if (mousePressed==true) {
        flipped=2;
      }
      cards2[i].flip();
      clicked2[i]=true;
      cardIndex2[flipped2]=i;
      cardFlipped2[flipped2]=i;
      flipped2++;
      println(flipped2);
      //delay(1000);
      if (flipped2==2) {
        println("flipped more than 2 cards");

        if (cardIndex2[1]==5 ||cardIndex2[0]==5) { // to prevent out of range error 
          if (cardIndex2[1]==5) {
            ind2[cardIndex2[1]] =1;
          } else if (cardIndex2[0]==5) {
            ind2[cardIndex2[0]] =1;
          }
        }
        //println(cards2[ind2[cardIndex2[0]]].movie());
        println(ind2[cardIndex2[0]]);
        //println(cards2[ind2[cardIndex2[1]]].movie());
        println(ind2[cardIndex2[1]]);

        if (cards2[ind2[cardIndex2[0]]].movie(ind2[cardIndex2[0]])==cards2[ind2[cardIndex2[1]]].movie(ind2[cardIndex2[1]])) {
          scoreNEW2++; // increase user score 
          //background(0,0,0); checking if my if statement works 
          println(score);
          println("cards match");
          cards2[cardFlipped2[0]].cardisMatched();
          cards2[cardFlipped2[1]].cardisMatched();
          flipped2=0;
        }
      }
    }
  }
}

// Functions to flip the cards back over 
// for TV theme 
void flip() {
  //fill(0, 0, 0);
  //rect(0, 70, 10, 10);
  // print instructions to the user 
  PFont flipText=createFont("monaco", 12);
  textFont(flipText, 14);
  fill(255, 94, 25);
  text("Take a good look at the cards and press the right arrow to flip them back", 30, 500);
//print an arrow 
  strokeWeight(2);
  stroke(255, 219, 41);
  line(420, 520, 480, 520);
  line(480, 520, 450, 510);
  line(480, 520, 450, 530);
  // to prevent out of range error 
  if (cardIndex[1]==5 ||cardIndex[0]==5) { 
    if (cardIndex[1]==5) {
      ind[cardIndex[1]] =3;
    } else if (cardIndex[0]==5) {
      ind[cardIndex[0]] =3;
    }
  }
  if (ind[cardIndex[0]]==6) {
    ind[cardIndex[0]]=3;
  }
  if (ind[cardIndex[1]]==6) {
    ind[cardIndex[1]]=3;
  }
  // if cards dont match and if the user presses the right key 
  if (cards[ind[cardIndex[0]]].movie(ind[cardIndex[0]])==cards[ind[cardIndex[1]]].movie(ind[cardIndex[1]])) {
  } else {
    if (keyPressed) {
      if (keyCode==RIGHT) {
        println("IN IF");
        println("you pressed me");
        // flip both cards back 
        cards[cardFlipped[0]].faceDown();
        cards[cardFlipped[1]].faceDown();
        
        // reset so they can be clicked again
        clicked[cardFlipped[0]]=false; //so u can click them again
        clicked[cardFlipped[1]]=false; //so u can click them again
        clicked[ind[cardIndex[0]]]=false; //so u can click them again
        clicked[ind[cardIndex[1]]]=false; //so u can click them again
        flipped=0; // set flipped back to 0
      }
    }
  }
}
// Repeat the same logic applied to flip to flip2 which controls the bands theme
void flip2() {
  //fill(0, 0, 0);
  //rect(0, 70, 10, 10);
  PFont flipText=createFont("monaco", 12);
  textFont(flipText, 14);
  fill(255, 94, 25);
  //textAlign(90, 64);
  text("Take a good look at the cards and press the right arrow to flip them back", 30, 500);
  //fill(255, 219, 41);
  strokeWeight(2);
  stroke(255, 219, 41);
  line(420, 520, 480, 520);
  line(480, 520, 450, 510);
  line(480, 520, 450, 530);

  println(ind1[cardIndex1[0]]);
  if (ind1[cardIndex1[0]]==6) {
    ind1[cardIndex1[0]]=3;
  }
  if (cards1[ind1[cardIndex1[0]]].movie(ind1[cardIndex1[0]])==cards1[ind1[cardIndex1[1]]].movie(ind1[cardIndex1[1]])) {
  } else {
    if (keyPressed) {
      if (keyCode==RIGHT) {
        println("IN IF");
        println("ypu pressed me");
        cards1[cardFlipped1[0]].faceDown();
        cards1[cardFlipped1[1]].faceDown();

        clicked1[cardFlipped1[0]]=false; //so u can click them again
        clicked1[cardFlipped1[1]]=false; //so u can click them again
        clicked1[ind1[cardIndex1[0]]]=false; //so u can click them again
        clicked1[ind1[cardIndex1[1]]]=false; //so u can click them again
        flipped1=0;
      }
    }
  }
}
// repeat the same logic applied to flip/flip2 to flip3 which controls the movies theme 
void flip3() {
  //fill(0, 0, 0);
  //rect(0, 70, 10, 10);
  PFont flipText=createFont("monaco", 12);
  textFont(flipText, 14);
  fill(255, 94, 25);
  //textAlign(90, 64);
  text("Take a good look at the cards and press the right arrow to flip them back", 30, 500);
  //fill(255, 219, 41);
  strokeWeight(2);
  stroke(255, 219, 41);
  line(420, 520, 480, 520);
  line(480, 520, 450, 510);
  line(480, 520, 450, 530);
  if (ind2[cardIndex2[0]]==6) {
    ind2[cardIndex2[0]]=1;
  }
  if (cards2[ind2[cardIndex2[0]]].movie(ind2[cardIndex2[0]])==cards2[ind2[cardIndex2[1]]].movie(ind2[cardIndex2[1]])) {
  } else {
    if (keyPressed) {
      if (keyCode==RIGHT) {
        println("IN IF");
        println("ypu pressed me");
        cards2[cardFlipped2[0]].faceDown();
        cards2[cardFlipped2[1]].faceDown();

        clicked2[cardFlipped2[0]]=false; //so u can click them again
        clicked2[cardFlipped2[1]]=false; //so u can click them again
        clicked2[ind2[cardIndex2[0]]]=false; //so u can click them again
        clicked2[ind2[cardIndex1[1]]]=false; //so u can click them again
        flipped2=0;
      }
    }
  }
}
