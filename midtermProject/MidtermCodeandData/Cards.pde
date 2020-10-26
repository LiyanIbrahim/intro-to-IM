//This is the TV cards class, accidentally called it MovieCards 
class MovieCards
{
  PImage backImage; // loads the images which are indexed 
  boolean flipped; //if not flipped 0, flipped 1  
  int xpos; // xposition for a card
  int ypos; // yposition for a card 
  int image=0; // index of the image it will display and refrence from the array --> used in construtor 
  String[] movieFiles={"back.jpeg", "tv2.jpg", "tv1,1.jpg", "tv3.jpg", "tv1,1.jpg", "tv2.jpg", "tv3.jpg", "match.jpg"};// I have to put each image twice since that is how the game works 
  //{"back.jpeg", "movie1.jpg", "movie2.jpg", "movie3.jpg", "movie1.jpg", "movie2.jpg", "movie3.jpg", "match.jpg"} 
  int display=0; // used to change the image displayed by using the index
  int indexx=0;

  MovieCards(int x, int y, int index) { // constructor and initialization 
    xpos=x;
    ypos=y;
    image=index;
    flipped=false;
  }
  void place() { //display
    backImage=loadImage(movieFiles[display]); //display first card at the start 
    backImage.resize(200, 200);
    image(backImage, xpos, ypos);
  }
  void flip() { // flips the image by changing the index in the place function 
    //backImage=loadImage(movieFiles[image]); // display card of index, image --> flipping the image 
    //backImage.resize(200, 200);
    //image(backImage, xpos, ypos);
    display=image;
  }
  void cardisMatched() { // displays the matched image for when they are matched 
    //delay(1000);   
    display=7; 
    //backImage=loadImage(movieFiles[show]); //display first card 
    //backImage.resize(200, 200);
    //image(backImage, xpos, ypos);
  }
  void faceDown() { // flip it back to the main image 
    //delay(1000);
    display=0;
    println("In facedown");

  }
  String movie(int x) { // takes the index and return the name of the image in the string array 
    return (movieFiles[x]);
  }
  void reset(){ // filp the cards back --> couldve used facedown 
    display=0;
    println("resetting"); 
  }
};
