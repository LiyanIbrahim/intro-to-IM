//global variables
//initialize hardware equipment
int yellowButton = 8;
int redButton = 12;
int LDR = A0;
int redLED = 5;
int blueLED = 6;
//global variables for code
int digital = 0;
int analog = 0;
int count = 1;
int count2 = 1;
int newDelay;
//setup
void setup() {
  Serial.begin(9600);
  // initializatopn of pinMODE
  pinMode(yellowButton, INPUT);
  pinMode(redButton, INPUT);

}

void loop() {
  //read button states into variables
  int buttonState = digitalRead(yellowButton);
  int buttonStateRED = digitalRead(redButton);

  // if you click on yellow button, play digital pattern once
  if (buttonState == HIGH) {
    digital++;
    count++;
    Serial.println(digital);
    Serial.println(count);
  } else if (buttonStateRED == HIGH) { //if you click on red button, play analog pattern once
    analog++;
    count2++;
    newDelay = analogRead(A0); //take the reading from the LDR first and base the delay on it
    Serial.println(newDelay);
  }

  if (digital > 0 && count > 0) { //play digital pattern
    digitalPattern();
  }
  if (analog > 0 && count2 > 0) { //play analog pattern
    analogPattern(newDelay);
  }



}

//digital input pattern
void digitalPattern() {
  digitalWrite(redLED, HIGH);//  twinkle
  delay(400 );
  digitalWrite(redLED, LOW);
  delay(500);

  digitalWrite(redLED, HIGH);// twinkle
  delay(400 );
  digitalWrite(redLED, LOW);
  delay(500); //ld

  digitalWrite(blueLED, HIGH); //li
  delay(200 );
  digitalWrite(blueLED, LOW);
  delay (200 );
  digitalWrite(redLED, HIGH); // tle
  delay(200  );
  digitalWrite(redLED, LOW);
  delay(200);
  digitalWrite(blueLED, HIGH); //star
  delay(400 );
  digitalWrite(blueLED, LOW);
  delay(600);//ld

  digitalWrite(redLED, HIGH);// how
  delay(300 );
  digitalWrite(redLED, LOW);
  delay(300);
  digitalWrite(redLED, HIGH);//I
  delay(300 );
  digitalWrite(redLED, LOW);
  delay(300);
  digitalWrite(blueLED, HIGH);// won
  delay(300 );
  digitalWrite(blueLED, LOW);
  delay(300);
  digitalWrite(blueLED, HIGH);//der
  delay(400 );
  digitalWrite(blueLED, LOW);
  delay(300); //ld

  digitalWrite(redLED, HIGH);//what
  delay(300 );
  digitalWrite(redLED, LOW);
  delay(300);
  digitalWrite(blueLED, HIGH);// you
  delay(300 );
  digitalWrite(blueLED, LOW);
  delay(300);
  digitalWrite(redLED, HIGH);//are
  delay(400 );
  digitalWrite(redLED, LOW);
  delay(400);
  count = 0;
}
void analogPattern( int newDelay) { // new delay is 400 and scale it 
  analogWrite(redLED, HIGH);//  twinkle
  delay(newDelay );
  analogWrite(redLED, LOW);
  delay(newDelay + 100);

  analogWrite(redLED, HIGH);// twinkle
  delay(newDelay );
  analogWrite(redLED, LOW);
  delay(newDelay + 100); //ld

  analogWrite(blueLED, HIGH); //li
  delay(newDelay - 200 );
  analogWrite(blueLED, LOW);
  delay (newDelay - 200 );
  analogWrite(redLED, HIGH); // tle
  delay(newDelay - 200  );
  analogWrite(redLED, LOW);
  delay(newDelay - 200);
  analogWrite(blueLED, HIGH); //star
  delay(newDelay );
  analogWrite(blueLED, LOW);
  delay(newDelay + 200); //ld

  analogWrite(redLED, HIGH);// how
  delay(newDelay - 100 );
  analogWrite(redLED, LOW);
  delay(newDelay - 100);
  analogWrite(redLED, HIGH);//I
  delay(newDelay - 100 );
  analogWrite(redLED, LOW);
  delay(newDelay - 100);
  analogWrite(blueLED, HIGH);// won
  delay(newDelay - 100 );
  analogWrite(blueLED, LOW);
  delay(newDelay - 100);
  analogWrite(blueLED, HIGH);//der
  delay(newDelay );
  analogWrite(blueLED, LOW);
  delay(newDelay - 100); //ld

  analogWrite(redLED, HIGH);//what
  delay(newDelay - 100 );
  analogWrite(redLED, LOW);
  delay(newDelay - 100);
  analogWrite(blueLED, HIGH);// you
  delay(newDelay - 100 );
  analogWrite(blueLED, LOW);
  delay(newDelay - 100);
  analogWrite(redLED, HIGH);//are
  delay(newDelay );
  analogWrite(redLED, LOW);
  delay(newDelay);
  count2 = 0;
}
