//this is the same code used from MovieCards class but for the bandsCard class 
class TvCards
{
  PImage backImage;
  boolean flipped; //if not flipped 0, flipped 1  
  int xpos; // xposition for a card
  int ypos; // yposition for a card 
  int image=0; // index of the image it will display and refrence from the array 
  String[] tvFiles={"back.jpeg", "movie1.jpg", "movie2.jpg", "movie3.jpg", "movie3.jpg", "movie2.jpg", "movie1.jpg", "match.jpg"};// I have to put each image twice since that is how the game works 
  int display=0;

  TvCards(int x, int y, int index) {
    xpos=x;
    ypos=y;
    image=index;
    flipped=false;
  }
  void place() { //display
    backImage=loadImage(tvFiles[display]); //display first card 
    backImage.resize(200, 200);
    image(backImage, xpos, ypos);
  }
  void flip() { // flip the images and compare. 
    display=image;
  }
  void cardisMatched() {   
    display=7;
    //backImage=loadImage(movieFiles[show]); //display first card 
    //backImage.resize(200, 200);
    //image(backImage, xpos, ypos);
  }
  void faceDown() {
    display=0;
  }
  String movie(int x) {
    return (tvFiles[x]);
  }
  void reset() {
    display=0;
    println("resetting");
  }
};
