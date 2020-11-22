//Liyan Ibrahim
//This is the code, along with the processing code for my LED memory game!

//initializing Global Variables
int blueButton = 0;    // blue
int redButton = 0;   // red
int yellowButton = 0;    // yellow
int inByte = 0;         // incoming serial byte
int blueLED = 8;
int redLED = 9;
int yellLED = 10;
int start = 0;
String vals[6];
String vals2[6];
//String p1[] = {"B", "B", "R", "Y", "Y", "Y"};
//String p2[] = {"R", "R", "R", "Y", "B", "B"};
int buttons[] = {2, 3, 4};
int buttonState = 0;
int pattern1IT = 0;
int pattern2IT = 0;
void setup() {
  // start serial port at 9600 bps and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(blueLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  pinMode(yellLED, OUTPUT);
  establishContact();  // send a byte to establish contact until receiver responds
}

void loop() {
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    //read buttons
    blueButton = digitalRead(2);
    redButton = digitalRead(3);
    yellowButton = digitalRead(4);
    //send button values
    Serial.print(blueButton);
    Serial.print(",");
    Serial.print(redButton);
    Serial.print(",");
    Serial.println(yellowButton);
    //play first pattern
    if (inByte == 'L') {
      pattern1();
    }
    //if wrong button is pressed (applied for both patterns)
    if (inByte == 1) {
      digitalWrite(blueLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellLED, HIGH);
      delay(200);
      digitalWrite(blueLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellLED, LOW);
      //delay(200);
    }
    if (inByte == 'H') {
      pattern2();
    }
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
void pattern1() { // first memory pattern

  if (pattern1IT == 0) {
    for (int i = 0; i < 2; i++) {
      digitalWrite(blueLED, HIGH);
      delay(200);
      digitalWrite(blueLED, LOW);
      delay(200);
    }
    digitalWrite(redLED, HIGH);
    delay(200);
    digitalWrite(redLED, LOW);
    delay(200);
    for (int i = 0; i < 3; i++) {
      digitalWrite(yellLED, HIGH);
      delay(200);
      digitalWrite(yellLED, LOW);
      delay(200);
    }
  }
  pattern1IT++; // to only play it once 
  delay(200);
}
void pattern2() { // second memory pattern
  if (pattern2IT == 0) {
    for (int i = 0; i < 3; i++) {
      digitalWrite(redLED, HIGH);
      delay(200);
      digitalWrite(redLED, LOW);
      delay(200);
    }
    digitalWrite(yellLED, HIGH);
    delay(200);
    digitalWrite(yellLED, LOW);
    delay(200);
    for (int j = 0; j < 2; j++) {
      digitalWrite(blueLED, HIGH);
      delay(200);
      digitalWrite(blueLED, LOW);
      delay(200);
    }
  }
  pattern2IT++; //to only play the pattern once 
}
//used for experimental reasons, not in this code 
//boolean array_cmp(String *a, String *b, int len_a, int len_b) { // compare 2 arrays
//  int n;
//
//  // if their lengths are different, return false
//  if (len_a != len_b) return false;
//
//  // test each element to be the same. if not, return false
//  for (n = 0; n < len_a; n++) if (a[n] != b[n]) return false;
//
//  //ok, if we have not returned yet, they are equal :)
//  return true;
//}
