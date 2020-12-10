//This code goes along with the processing code for the interactive study system

//global variables for initializing pins
int toggleSwitchPin = A1;
int toggleSwitch = 0; //analog
int inByte = 0;
int pot = A0;
int yellowButton = 6;
int redButton = 7;
int blueButton = 8;
int LDR = A5;
int blueLED = 2;
int redLED = 3;
int yellowLED = 4;

//blink without delay taken from the multitasking tutorial
class Flasher
{
    // Class Member Variables
    // These are initialized at startup
    int ledPin;      // the number of the LED pin
    long OnTime;     // milliseconds of on-time
    long OffTime;    // milliseconds of off-time

    // These maintain the current state
    int ledState;                 // ledState used to set the LED
    unsigned long previousMillis;   // will store last time LED was updated

    // Constructor - creates a Flasher
    // and initializes the member variables and state
  public:
    Flasher(int pin, long on, long off)
    {
      ledPin = pin;
      pinMode(ledPin, OUTPUT);

      OnTime = on;
      OffTime = off;

      ledState = LOW;
      previousMillis = 0;
    }

    void Update()
    {
      // check to see if it's time to change the state of the LED
      unsigned long currentMillis = millis();

      if ((ledState == HIGH) && (currentMillis - previousMillis >= OnTime))
      {
        ledState = LOW;  // Turn it off
        previousMillis = currentMillis;  // Remember the time
        digitalWrite(ledPin, ledState);  // Update the actual LED
      }
      else if ((ledState == LOW) && (currentMillis - previousMillis >= OffTime))
      {
        ledState = HIGH;  // turn it on
        previousMillis = currentMillis;   // Remember the time
        digitalWrite(ledPin, ledState);   // Update the actual LED
      }
    }
};

//blink without delay objects
Flasher ledB(2, 100, 100);
Flasher ledR(3, 350, 150);
Flasher ledY(4, 350, 150);
Flasher ledB1(2, 200, 100);
Flasher ledR1(3, 200, 100);
Flasher ledY1(4, 200, 100);

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ;
  }
  pinMode(yellowButton, INPUT);
  pinMode(toggleSwitchPin, INPUT);
  pinMode(redButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(LDR, INPUT);
  establishContact();
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    //read all sensors and communicate them as csvs
    int potValue = analogRead(pot);
    toggleSwitch = digitalRead(toggleSwitchPin);
    int yellowBValue = digitalRead(yellowButton);
    int redBValue = digitalRead(redButton);
    int blueBValue = digitalRead(blueButton);
    int ldrValue = analogRead(LDR);
    Serial.print(potValue);
    Serial.print(",");
    Serial.print(toggleSwitch);
    Serial.print(",");
    Serial.print(yellowBValue);
    Serial.print(",");
    Serial.print(redBValue);
    Serial.print(",");
    Serial.print(blueBValue);
    Serial.print(",");
    Serial.println(ldrValue);
    //for blinking the LEDs, we need a signal from processing to know which LED pattern to blink based on the inbyte sent 
    if (inByte == 'L') {
      digitalWrite(blueLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, LOW);
    }
    if (inByte == 'H') {

      digitalWrite(blueLED, HIGH);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, HIGH);
    }
    if (inByte == '1') {
      digitalWrite(blueLED, LOW);
      digitalWrite(redLED, LOW);
      digitalWrite(yellowLED, HIGH);
    }
    if (inByte == '2') {
      digitalWrite(blueLED, LOW);
      digitalWrite(redLED, HIGH);
      digitalWrite(yellowLED, LOW);
    }
    if (inByte == '3') { //party pattern 
      ledB.Update();
      ledR.Update();
      ledY.Update();
      for (int i = 0; i < 5; i++) {
        ledB1.Update();
        ledR1.Update();
        ledY1.Update();
      }
      ledB.Update();
      ledR.Update();
      ledY.Update();

    }
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("255,0,0,0,0,0");   // send an initial string
    delay(300);
  }
}
