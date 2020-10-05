/* This code is a data visualization concept of displaying greenhouse gases concentration from 4 different sectors in 3 different regions in the world. In order to use, run the program and hover over the region then hover over the circle with the desired sector to reveal the concentration produced by this vector. 
 I used this link to get the information and produce my own datasheet that is saved as a csv 
 https://www.wri.org/blog/2020/02/greenhouse-gas-emissions-by-country-sector */


// Assignment 4. October 4,2020. By Liyan Ibrahim 

//initialization 
PImage background;
String c1= "Middle East, North Africa";
String c2= "European Union";
String c3= "East Asia, Pacific";
String c4= "Energy";
String c5= "Industry";
String c6= "Agriculture";
String c7= "Waste";

//stores a table of my csv 
Table data;


void setup() {
  size(510, 383); //size needs to be the size of my background image 
  backk(); // call the function that loads my background image 
  data= loadTable("data.csv", "header"); // load my data into the data table and remove the header row
}

void draw() {
  //backk();
  // if hover over the first rectangle, call function case1 
  if (mouseX>0 && mouseX<510 && mouseY>0 && mouseY<128) {
    case1();
  }
  // if hover over the second rectangle, call function case2 
  if (mouseX>0 && mouseX<510 &&mouseY>128 &&mouseY<255) {
    case2();
  }
  // if hover over the third rectangle, call function case3 
  if (mouseX>0 && mouseX<510 &&mouseY>255 &&mouseY<383) {
    case3();
  }
}
// FUNCTIONS 

// function that sets backgorund image and makes the grid and regions for the main page 
void backk() {
  background=loadImage("background.png"); //using a background image 
  background(background);
  //making the grid 
  fill(0, 0, 0); 
  strokeWeight(4);
  line(0, 128, 510, 128);
  line(0, 255, 510, 255);
  //first box
  PFont MiddleEast = createFont("monaco", 24);
  textFont(MiddleEast, 24);
  fill(0, 0, 0);
  textAlign(90, 64);
  text(c1, 60, 64);
  //second box
  PFont EU = createFont("monaco", 24);
  textFont(EU, 24);
  fill(0, 0, 0);
  textAlign(90, 64);
  text(c2, 140, 200);
  //third box 
  PFont EastAsia = createFont("monaco", 24);
  textFont(EastAsia, 24);
  fill(0, 0, 0);
  textAlign(90, 64);
  text(c3, 120, 330);
}

// if hover over Middle East, North Afirca 
void case1() {
  backk();
  fill(207, 207, 207);
  rect(0, 0, 510, 128);
  int increment=0;// increment of circles
  // draw 4 circles 
  for (int i=0; i<4; i++) {
    fill(0, 0, 0);
    ellipse(63+increment, 64, 90, 90); 
    increment+=120;
  }
  //print energy on first circle 
  PFont energy = createFont("monaco", 12);
  textFont(energy, 14);
  fill(255, 255, 255);
  textAlign(90, 64);
  text(c4, 40, 64);
  // if hover over circle one, display the amount from the table and csv 
  if (mouseX>33 && mouseX<93 && mouseY>34 && mouseY<94) {
    fill(222, 255, 235);
    ellipse(63, 64, 90, 90);
    PFont ME = createFont("monaco", 12);
    textFont(ME, 14);
    fill(0, 0, 0);
    textAlign(90, 64);
    text(data.getString(0, 1), 38, 64);
  }
  //print industry on second circle 
  PFont industry = createFont("monaco", 12);
  textFont(industry, 14);
  fill(255, 255, 255);
  textAlign(90, 64);
  text(c5, 148, 64);
  //if you hover over it, display the amount from the table and csv 
  if (mouseX>33+120 && mouseX<93+120 && mouseY>34 && mouseY<94) {
    fill(222, 255, 235);
    ellipse(63+120, 64, 90, 90);
    PFont MI = createFont("monaco", 12);
    textFont(MI, 14);
    fill(0, 0, 0);
    textAlign(90, 64);
    text(data.getString(0, 2), 155, 64);
  }
  //print agriculture on third circle
  PFont agricul = createFont("monaco", 12);
  textFont(agricul, 14);
  fill(255, 255, 255);
  textAlign(90, 64);
  text(c6, 257, 64);
  //if you hover over it, display the amount from the table and csv
  if (mouseX>33+(120*2) && mouseX<93+(120*2) && mouseY>34 && mouseY<94) {
    fill(222, 255, 235);
    ellipse(63+(120*2), 64, 90, 90);
    PFont MA = createFont("monaco", 12);
    textFont(MA, 14);
    fill(0, 0, 0);
    textAlign(90, 64);
    text(data.getString(0, 3), 275, 64);
  }
  //print waste on forth circle
  PFont waste = createFont("monaco", 12);
  textFont(waste, 14);
  fill(255, 255, 255);
  textAlign(90, 64);
  text(c7, 400, 64);
  //if you hover over it, display the amount from the table and csv 
  if (mouseX>33+(120*3) && mouseX<93+(120*3) && mouseY>34 && mouseY<94) {
    fill(222, 255, 235);
    ellipse(63+(120*3), 64, 90, 90);
    PFont MW = createFont("monaco", 12);
    textFont(MW, 14);
    fill(0, 0, 0);
    textAlign(90, 64);
    text(data.getString(0, 4), 395, 64);
  }
}
//if hover over second rectangle, repeat the code for case1 but with different xy positions  
void case2() {
  backk();
  fill(136, 153, 143);
  rect(0, 128, 510, 127);
  int space=0;
  for (int i=0; i<4; i++) {
    fill(0, 0, 0);
    ellipse(63+space, 192, 90, 90); 
    space+=120;
  }
  PFont energy = createFont("monaco", 12);
  textFont(energy, 14);
  fill(255, 255, 255);
  textAlign(90, 192);
  text(c4, 40, 192);
  if (mouseX>33 && mouseX<93 && mouseY>162 && mouseY<222) {
    fill(222, 255, 235);
    ellipse(63, 192, 90, 90);
    PFont EE = createFont("monaco", 12);
    textFont(EE, 14);
    fill(0, 0, 0);
    textAlign(90, 192);
    text(data.getString(1, 1), 38, 192);
  }

  PFont industry = createFont("monaco", 12);
  textFont(industry, 14);
  fill(255, 255, 255);
  textAlign(90, 192);
  text(c5, 148, 192);
  if (mouseX>33+120 && mouseX<93+120 && mouseY>162 && mouseY<222) {
    fill(222, 255, 235);
    ellipse(63+120, 192, 90, 90);
    PFont EI = createFont("monaco", 12);
    textFont(EI, 14);
    fill(0, 0, 0);
    textAlign(90, 192);
    text(data.getString(1, 2), 155, 192);
  }

  PFont agricul = createFont("monaco", 12);
  textFont(agricul, 14);
  fill(255, 255, 255);
  textAlign(90, 192);
  text(c6, 257, 192);
  if (mouseX>33+(120*2) && mouseX<93+(120*2) && mouseY>162 && mouseY<222) {
    fill(222, 255, 235);
    ellipse(63+(120*2), 192, 90, 90);
    PFont EA = createFont("monaco", 12);
    textFont(EA, 14);
    fill(0, 0, 0);
    textAlign(90, 192);
    text(data.getString(1, 3), 275, 192);
  }
  PFont waste = createFont("monaco", 12);
  textFont(waste, 14);
  fill(255, 255, 255);
  textAlign(90, 192);
  text(c7, 400, 192);
  if (mouseX>33+(120*3) && mouseX<93+(120*3) && mouseY>162 && mouseY<222) {
    fill(222, 255, 235);
    ellipse(63+(120*3), 192, 90, 90);
    PFont EW = createFont("monaco", 12);
    textFont(EW, 14);
    fill(0, 0, 0);
    textAlign(90, 192);
    text(data.getString(1, 4), 395, 192);
  }
}
//if hover over third rectangle, repeat the code for case1 but with different xy positions  
void case3() {
  backk();
  fill(155, 166, 186);
  rect(0, 255, 510, 128);
  int space=0;
  for (int i=0; i<4; i++) {
    fill(0, 0, 0);
    ellipse(63+space, 320, 90, 90); 
    space+=120;
  }
  PFont energy = createFont("monaco", 12);
  textFont(energy, 14);
  fill(255, 255, 255);
  textAlign(90, 192);
  text(c4, 40, 320);
  if (mouseX>33+(120*0) && mouseX<93+(120*0) && mouseY>290 && mouseY<350) {
    fill(222, 255, 235);
    ellipse(63+(120*0), 320, 90, 90);
    PFont PE = createFont("monaco", 12);
    textFont(PE, 14);
    fill(0, 0, 0);
    textAlign(90, 192);
    text(data.getString(2, 1), 35, 320);
  }

  PFont industry = createFont("monaco", 12);
  textFont(industry, 14);
  fill(255, 255, 255);
  textAlign(90, 320);
  text(c5, 148, 320);
  if (mouseX>33+(120*1) && mouseX<93+(120*1) && mouseY>290 && mouseY<350) {
    fill(222, 255, 235);
    ellipse(63+(120*1), 320, 90, 90);
    PFont PI = createFont("monaco", 12);
    textFont(PI, 14);
    fill(0, 0, 0);
    textAlign(90, 320);
    text(data.getString(2, 2), 155, 320);
  }

  PFont agricul = createFont("monaco", 12);
  textFont(agricul, 14);
  fill(255, 255, 255);
  textAlign(90, 320);
  text(c6, 257, 320);
  if (mouseX>33+(120*2) && mouseX<93+(120*2) && mouseY>290 && mouseY<350) {
    fill(222, 255, 235);
    ellipse(63+(120*2), 320, 90, 90);
    PFont PA = createFont("monaco", 12);
    textFont(PA, 14);
    fill(0, 0, 0);
    textAlign(90, 320);
    text(data.getString(2, 3), 275, 320);
  }
  PFont waste = createFont("monaco", 12);
  textFont(waste, 14);
  fill(255, 255, 255);
  textAlign(90, 320);
  text(c7, 400, 320);
  if (mouseX>33+(120*3) && mouseX<93+(120*3) && mouseY>290 && mouseY<350) {
    fill(222, 255, 235);
    ellipse(63+(120*3), 320, 90, 90);
    PFont PW = createFont("monaco", 12);
    textFont(PW, 14);
    fill(0, 0, 0);
    textAlign(90, 320);
    text(data.getString(2, 4), 395, 320);
  }
}
