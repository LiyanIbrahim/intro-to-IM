//this is the same code used from MovieCards class but for the bandsCard class 
class BandCards
{
  PImage backImage;
  boolean flipped; //if not flipped 0, flipped 1  
  int xpos; // xposition for a card
  int ypos; // yposition for a card 
  int image=0; // index of the image it will display and refrence from the array 
  String[] bandFiles={"back.jpeg", "bands2.jpeg", "bands3.jpeg", "bands3.jpeg", "bands1.jpg", "bands1.jpg", "bands2.jpeg", "match.jpg"};// I have to put each image twice since that is how the game works 
  int display=0;

  BandCards(int x, int y, int index) {
    xpos=x;
    ypos=y;
    image=index;
    flipped=false;
  }
  void place() { //display
    backImage=loadImage(bandFiles[display]); //display first card 
    backImage.resize(200, 200);
    image(backImage, xpos, ypos);
  }
  void flip() { // flip the images
    //backImage=loadImage(movieFiles[image]); // display card of index, image --> flipping the image 
    //backImage.resize(200, 200);
    //image(backImage, xpos, ypos);
    display=image;

  }
  void cardisMatched() {
    //delay(1000); 
    display=7;
    //backImage=loadImage(movieFiles[show]); //display first card 
    //backImage.resize(200, 200);
    //image(backImage, xpos, ypos);
  }
  void faceDown() {
    display=0;
  }
  String movie(int x) {
    return (bandFiles[x]);
  }
  void reset() {
    display=0;
    println("resetting");
  }
};
