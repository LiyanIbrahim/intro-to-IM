void setup() {
  size(400, 400);
}
void draw() {
  lineBackground();
  ellipsePattern();
}

//function definitions 
void ellipsePattern() { //produces the first pattern of the overlapping ellipses 
  // these variables are used to increment the xy starting position of the ellipse 
  int r=0;
  int z=0;
  for (int x=300; x>=10; x-=30) { // x is used for the width and height of the circle 
    for (int y=300; y>=10; y-=30) { // y is used to produce the pattern  
      ellipse(r, z, x, x); 
      r+=1; //increment r and z which change the position of the circle 
      z+=2;
    }
  }
}
//produces the strokes in the background 
void lineBackground() {
  for (int x=0; x<=width; x+=25) {
    for (int y=0; y<=height; y+=25) {
      fill(245, 245, 255);
      strokeWeight(2);
      line(mouseX, mouseY, x*9, y*7); // follows mouse and allows the user to fill in the window
    }
  }
}
