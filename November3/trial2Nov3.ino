// Done by Liyan Ibrahim 
//Two stages: the first one being that the three LEDs blink at different rates but the on and off time are the same for each of the LED’s, the user has to click on the LED blinking at the fastest rate. The second stage, the user has to choose the LED that stays ON for the longest period of time and the LEDs have different on and off periods. 

// global variables setup
int timeer = 0;
// declaring lights and buttons
int blueButton = A5;
int yellowButton = A0;
int redButton = A4;
int greenButton = A2;
int blueLight = 13;
int yellowLight = 11;
int redLight = 9;

//setup
void setup() {
  Serial.begin(9600);
  pinMode(blueLight, OUTPUT);
  pinMode(yellowLight, OUTPUT);
  pinMode(redLight, OUTPUT);
  pinMode(blueButton, INPUT);
  pinMode(yellowButton, INPUT);
  pinMode(redButton, INPUT);

}

// class so we can have the LED's blink with different on and off times without delay --> taken from Adafruit multitasking tutorial
class Blinker {
    int color;      // the number of the LED pin
    long OnTime;     // milliseconds of on-time
    long OffTime;    // milliseconds of off-time
    int state;
    unsigned long previousMillis;
  public:
    Blinker(int pin, long on, long off)
    {
      color = pin;
      pinMode(color, OUTPUT);

      OnTime = on;
      OffTime = off;

      state = LOW;
      previousMillis = 0;
    }
    void Update()
    {
      // check to see if it's time to change the state of the LED
      unsigned long currentMillis = millis();

      if ((state == HIGH) && (currentMillis - previousMillis >= OnTime))
      {
        state = LOW;  // Turn it off
        previousMillis = currentMillis;  // Remember the time
        digitalWrite(color, state);  // Update the actual LED
      }
      else if ((state == LOW) && (currentMillis - previousMillis >= OffTime))
      {
        state = HIGH;  // turn it on
        previousMillis = currentMillis;   // Remember the time
        digitalWrite(color, state);   // Update the actual LED
      }
    }
};

// faster game LEDs declartion (level1)
Blinker level1Blue(blueLight, 300, 300);
Blinker level1Yellow(yellowLight, 700, 700);
Blinker level1Red(redLight, 1000, 1000);

//on for the longest time LED declarations (level2)
Blinker level2Blue(blueLight, 700, 300);
Blinker level2Yellow(yellowLight, 900, 700);
Blinker level2Red(redLight, 600, 1000);

//global variables used in loop (not needed for the class)
int startEnd = 0;
int help = 0;
int help2 = 0;
int l2 = 0;
int timer2 = 0;
int helpl2 = 0;
int level = 1;

void loop() {
  if ( startEnd == 0) { // if levels arent done, go inside the loop
    if (timeer == 0) { // play level 1
      level1();
    }

    //once user observed, press green button
    if (digitalRead(greenButton) == HIGH) {
      Serial.println("in stopping if");
      timeer++; // increase timeer so it doesnt replay the level (inside the first If statement)
      //make sure all lights are off
      digitalWrite(blueLight, LOW);
      digitalWrite(yellowLight, LOW);
      digitalWrite(redLight, LOW);
      help++;
    }
    if (timeer > 0 && l2 == 0) {
      Serial.println("in first if");
      if (digitalRead(blueButton) == HIGH) { // if user picks blue which is the correct answer, have all the lights on and then off and move to level2
        Serial.println("in correct if");
        digitalWrite(blueLight, HIGH);
        digitalWrite(yellowLight, HIGH);
        digitalWrite(redLight, HIGH);
        delay(1000);
        digitalWrite(blueLight, LOW);
        digitalWrite(yellowLight, LOW);
        digitalWrite(redLight, LOW);
        l2++; // move to level 2

      }

      else if (digitalRead(yellowButton) == HIGH || digitalRead(redButton) == HIGH ) { // else if the user picks yellow or red, have the blue LED light up 3 times then move to level2
        for (int i = 0; i < 3; i++) {
          digitalWrite(blueLight, HIGH);
          delay(500);
          digitalWrite(blueLight, LOW);
          delay(500);
          l2++;
        }
      }
    }

    if (l2 > 0) { // if user is in level 2 play level2GAME
      level2GAME();
    }
  }
}

//Obvoius difference in speed and same on and off time
void level1() {
  Serial.println("IN level1");
  level1Blue.Update();
  level1Yellow.Update();
  level1Red.Update();
}
void level2() {
  Serial.print("IN level2");
  level2Blue.Update();
  level2Yellow.Update();
  level2Red.Update();
}

void level2GAME() {

  if (timer2 == 0) { // play level 2 game until user presses green button
    level2();
  }
  if (digitalRead(greenButton) == HIGH) { // if green button is pressed, stop playing the pattern and turn the lights off
    timer2++;
    digitalWrite(blueLight, LOW);
    digitalWrite(yellowLight, LOW);
    digitalWrite(redLight, LOW);
    helpl2++;
  }
  if (timer2 > 0) {

    if (digitalRead(yellowButton) == HIGH) { // if yellow button is pressed (correct answer), all the LED's light up for one second
      Serial.println("In correct if");
      digitalWrite(blueLight, HIGH);
      digitalWrite(yellowLight, HIGH);
      digitalWrite(redLight, HIGH); // turn the LED on (HIGH is the voltage level)
      delay(1000);
      digitalWrite(blueLight, LOW);
      digitalWrite(yellowLight, LOW);
      digitalWrite(redLight, LOW); // turn the LED on (HIGH is the voltage level)
      startEnd++; // end game since 2 levels completed
    }

    if ( digitalRead(blueButton) == HIGH || digitalRead(redButton) == HIGH ) { //if blue or red button is pressed, turn yellow LED on 3 times  since it is the right answer and end game
      for (int i = 0; i < 3; i++) {
        digitalWrite(yellowLight, HIGH);
        delay(500);
        digitalWrite(yellowLight, LOW);
        delay(500);
        startEnd++; // end game
      }
    }

  }

}
