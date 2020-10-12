//Assignment 6, Done by Liyan Ibrahim 
//For this assignment, I was inspired by Daniel Shiffmans’ Painting with pixels idea of using the color of the pixel in the location to draw a certain shape. From that, I decided to implement that using different shapes. The idea then developed into using different images loaded into an array and using part of the image since I did not want to paint the image but rather use part of it and the color to develop an abstract illustration. I then added a level of user interaction using the mouse clicked function.

// global variables 
int index = 0; //image index 
int maxImages=10; // number of images in array 
int type=0; // the pattern followed 

// Declaring an array of images.
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(800, 800);
  for (int i = 0; i < images.length; i ++ ) { //populate the array with images 
    images[i] = loadImage( "org" + i + ".bmp" );
  }
}
void draw() {
  for (int i=0; i<100; i++) {
    float x=random(width); // choose a random x coordinate 
    float y=random(height); //choose a random y coordinate 
    color c= images[index].get(int(x), int(y)); // set color c as a certain images portion from x,y 
    // based on the value of type, choose the shape to draw using the color of the image 
    if (type==0) { 
      drawHEART(x, y, c);
    } else if (type==1) {
      drawEllipse( x, y, c);
    } else if ( type==2) {
      rectangle(x, y, c);
    }
    println(index); // print index for my reference 
  }
}

void drawHEART(float x, float y, color c) {
  fill(c, 25);
  beginShape();
  vertex(x, y);
  bezierVertex(x, y, x+40, y-10, x, x-10);
  vertex(50, 15);
  bezierVertex(x, y, x-40, y-10, x, x-10);
  endShape();
}
void drawEllipse(float x, float y, color c) {
  fill(c, 50);
  noStroke();
  ellipse(x, y, 30, 30);
}
void rectangle(float x, float y, color c) {
  fill(c, 50);
  noStroke();
  rect(x, y, 30, 30);
}

void mousePressed() {
  // if mouse is pressed, randomize the image and shape 
  index = int(random(images.length));
  type=int(random(0, 3));
}
