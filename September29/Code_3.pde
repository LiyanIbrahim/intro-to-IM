//class that generates the pattern 
class Generate {

  float speed, initialT, R, G, B, thickness;  

  Generate(float s, float T, float red, float green, float blue, float st) //constructor 
  {
    speed =s;
    initialT =T;
    R =red;
    G =green;
    B =blue;
    thickness =st;
  }
  void drawing1() { //produces the patterns 
    //pattern 1 which is the curved lines on the left side 
    float x= sin(initialT/10) *100 +sin(initialT)*100; // x coordinate of the points is a sin function 
    float y= cos(initialT/20)*100; // y coordinate of the points is a cos function 
    stroke(R, G, B);
    strokeWeight(thickness);
    point(x, y); // draw point 
    initialT++; // increment to produce continues patterns 

    //second pattern which is the ellipse that eventually form abstarct versions of bar charts 
    for (int i=0; i<400; i++) { 
      fill(R, G, B);
      ellipse(speed, initialT, 7, 7); // hard-coded the width and height so they are the same size but diff starting points
    }
  }
}


Generate[] myArt=new Generate[100]; 
void setup() {
  size(230, 230); // I wanted a canvus size that would look proportionate with the pattern 
  for (int i=0; i<myArt.length; i++) { //populate the array with objects 
    myArt[i]=new Generate(random(400), random(500), random(255), random(255), random(255), random(1, 10));
  }
}

void draw() {
  for (int i=0; i<myArt.length; i++) { // print the drawings 
    myArt[i].drawing1();
  }
}
