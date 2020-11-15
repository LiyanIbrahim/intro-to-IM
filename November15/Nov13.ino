#include "pitches.h"

//global variables:
int yellowButton = A0;
int redButton = 4;
int blueButton = 6;
int greenButton = 9;
int buzzer = 8;
int pot = A1;

//for blinking the LED without delay
const int ledPin =  12;
int ledState = LOW;
long previousMillis = 0;
long intervalMode1 = 2000;
long intervalMode2 = 1400;
long intervalMode3 = 800;
long intervalMode4 = 200;

//for MODE1 this song is "take on me"
int melody[] = {
  NOTE_FS5, NOTE_FS5, NOTE_D5, NOTE_B4, NOTE_B4, NOTE_E5,
  NOTE_E5, NOTE_E5, NOTE_GS5, NOTE_GS5, NOTE_A5, NOTE_B5,
  NOTE_A5, NOTE_A5, NOTE_A5, NOTE_E5, NOTE_D5, NOTE_FS5,
  NOTE_FS5, NOTE_FS5, NOTE_E5, NOTE_E5, NOTE_FS5, NOTE_E5
};

// The note duration, 8 = 8th note, 4 = quarter note, etc.
int durations[] = {
  8, 8, 8, 4, 4, 4,
  4, 5, 8, 8, 8, 8,
  8, 8, 8, 4, 4, 4,
  4, 5, 8, 8, 8, 8
};
// determine the length of the arrays to use in the loop iteration
int songLength = sizeof(melody) / sizeof(melody[0]);


//for MODE2 this song is from Mario Cart
int underworld_melody[] = {
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_C4, NOTE_C5, NOTE_A3, NOTE_A4,
  NOTE_AS3, NOTE_AS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0,
  NOTE_F3, NOTE_F4, NOTE_D3, NOTE_D4,
  NOTE_DS3, NOTE_DS4, 0,
  0, NOTE_DS4, NOTE_CS4, NOTE_D4,
  NOTE_CS4, NOTE_DS4,
  NOTE_DS4, NOTE_GS3,
  NOTE_G3, NOTE_CS4,
  NOTE_C4, NOTE_FS4, NOTE_F4, NOTE_E3, NOTE_AS4, NOTE_A4,
  NOTE_GS4, NOTE_DS4, NOTE_B3,
  NOTE_AS3, NOTE_A3, NOTE_GS3,
  0, 0, 0
};
//Underwolrd tempo
int underworld_tempo[] = {
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  3,
  12, 12, 12, 12,
  12, 12, 6,
  6, 18, 18, 18,
  6, 6,
  6, 6,
  6, 6,
  18, 18, 18, 18, 18, 18,
  10, 10, 10,
  10, 10, 10,
  3, 3, 3
};
int sizee = sizeof(underworld_melody) / sizeof(int);

//for mode 3 this song is the Dart Vader theme from starwars
int melody3[] = {
  // Score available at https://musescore.com/user/202909/scores/1141521
  // The tenor saxophone part was used

  NOTE_AS4, 8, NOTE_AS4, 8, NOTE_AS4, 8, //1
  NOTE_F5, 2, NOTE_C6, 2,
  NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F6, 2, NOTE_C6, 4,
  NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F6, 2, NOTE_C6, 4,
  NOTE_AS5, 8, NOTE_A5, 8, NOTE_AS5, 8, NOTE_G5, 2, NOTE_C5, 8, NOTE_C5, 8, NOTE_C5, 8,
  NOTE_F5, 2, NOTE_C6, 2,
  NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F6, 2, NOTE_C6, 4,


};
int notes = sizeof(melody3) / sizeof(melody3[0]) / 2;
int tempo = 100; //speed
int wholenote = (60000 * 4) / tempo;

int divider = 0, noteDuration2 = 0;

//mode 4 this is a Beethoven song
int melody4[] = {


  NOTE_E4, 4,  NOTE_E4, 4,  NOTE_F4, 4,  NOTE_G4, 4, //1
  NOTE_G4, 4,  NOTE_F4, 4,  NOTE_E4, 4,  NOTE_D4, 4,
  NOTE_C4, 4,  NOTE_C4, 4,  NOTE_D4, 4,  NOTE_E4, 4,
  NOTE_E4, -4, NOTE_D4, 8,  NOTE_D4, 2,

  NOTE_E4, 4,  NOTE_E4, 4,  NOTE_F4, 4,  NOTE_G4, 4, //4
  NOTE_G4, 4,  NOTE_F4, 4,  NOTE_E4, 4,  NOTE_D4, 4,
  NOTE_C4, 4,  NOTE_C4, 4,  NOTE_D4, 4,  NOTE_E4, 4,
  NOTE_D4, -4,  NOTE_C4, 8,  NOTE_C4, 2,


};
int tempo4 = 114;
int notes4 = sizeof(melody4) / sizeof(melody4[0]) / 2;
int wholenote4 = (60000 * 4) / tempo4;

int divider4 = 0, noteDuration4 = 0;

//setup
void setup() {
  Serial.begin(9600);
  pinMode(yellowButton, INPUT);
  pinMode(redButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(greenButton, INPUT);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  int sensorValue = analogRead(pot); // read the value from the potentiometer
  // I identified the range of readings of the potentiometer for the modes
  if (sensorValue >= 0 && sensorValue < 160) { //mode 1
    mode1();
  }
  if (sensorValue >= 160 && sensorValue < 530) { //mode 2
    mode2();
  }
  if (sensorValue >= 530 && sensorValue < 880) { //mode 3
    mode3();
  }
  if (sensorValue >= 880 && sensorValue <= 1023) { //mode 4
    mode4();
  }

}

void mode1() {
  //I want to blink without delays
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > intervalMode1) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
  }
  //piano notes
  if (digitalRead(yellowButton) == HIGH) {
    tone(buzzer, 300, 200);
  }
  if (digitalRead(redButton) == HIGH) {
    tone(buzzer, 400, 200);
  }
  if (digitalRead(blueButton) == HIGH) {
    tone(buzzer, 500, 200);
  }
  //song
  if (digitalRead(greenButton) == HIGH) {
    digitalWrite(ledPin, HIGH); // LED will be on when song is on
    for (int thisNote = 0; thisNote < songLength; thisNote++) {
      int duration = 1000 / durations[thisNote];
      tone(8, melody[thisNote], duration);
      // pause between notes
      int pause = duration * 1.3;
      delay(pause);
      // stop the tone
      noTone(8);
    }
  }
  delay(10);
}

void mode2() {
  Serial.println("In mode 2");
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > intervalMode2) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
  }
  //piano notes
  if (digitalRead(yellowButton) == HIGH) {
    tone(buzzer, 800, 200);
  }
  if (digitalRead(redButton) == HIGH) {
    tone(buzzer, 900, 200);
  }
  if (digitalRead(blueButton) == HIGH) {
    tone(buzzer, 1000, 200);
  }
  //song
  if (digitalRead(greenButton) == HIGH) {
    digitalWrite(ledPin, HIGH); // LED will be on when song is on
    Serial.println(" 'Underworld Theme'");
    for (int thisNote = 0; thisNote < sizee; thisNote++) {
      int noteDuration = 1000 / underworld_tempo[thisNote];
      tone(8, underworld_melody[thisNote], noteDuration);
      // pause between notes
      int pause = noteDuration * 1.3;
      delay(pause);
      // stop the tone
      noTone(8);
    }
  }
  delay(10);
}


void mode3() {
  Serial.println("IN MODE 3");
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > intervalMode3) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
  }
  //piano notes
  if (digitalRead(yellowButton) == HIGH) {
    tone(buzzer, 1300, 200);
  }
  if (digitalRead(redButton) == HIGH) {
    tone(buzzer, 1400, 200);
  }
  if (digitalRead(blueButton) == HIGH) {
    tone(buzzer, 1500, 200);
  }
  //song
  if (digitalRead(greenButton) == HIGH) {
    digitalWrite(ledPin, HIGH);// LED will be on when song is on
    for (int thisNote = 0; thisNote < notes * 2; thisNote = thisNote + 2) {
      divider = melody3[thisNote + 1];
      if (divider > 0) {
        noteDuration2 = (wholenote) / divider;
      } else if (divider < 0) {

        noteDuration2 = (wholenote) / abs(divider);
        noteDuration2 *= 1.5;
      }
      tone(buzzer, melody3[thisNote], noteDuration2 * 0.9);

      // Wait for the specief duration before playing the next note.
      delay(noteDuration2);

      // stop the waveform generation before the next note.
      noTone(buzzer);
    }
  }
  delay(10);

}

void mode4() {
  Serial.println("IN MODE 4");
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis > intervalMode4) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;

    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(ledPin, ledState);
  }
  //piano notes
  if (digitalRead(yellowButton) == HIGH) {
    tone(buzzer, 1800, 200);
  }
  if (digitalRead(redButton) == HIGH) {
    tone(buzzer, 1900, 200);
  }
  if (digitalRead(blueButton) == HIGH) {
    tone(buzzer, 2000, 200);
  }
  //song
  if (digitalRead(greenButton) == HIGH) {
    digitalWrite(ledPin, HIGH);// LED will be on when song is on
    for (int thisNote = 0; thisNote < notes * 2; thisNote = thisNote + 2) {

      // calculates the duration of each note
      divider4 = melody4[thisNote + 1];
      if (divider4 > 0) {
        // regular note, just proceed
        noteDuration4 = (wholenote4) / divider4;
      } else if (divider4 < 0) {
        noteDuration4 = (wholenote4) / abs(divider4);
        noteDuration4 *= 1.5;
      }
      tone(buzzer, melody4[thisNote], noteDuration4 * 0.9);

      // Wait for the specief duration before playing the next note.
      delay(noteDuration4);

      // stop the waveform generation before the next note.
      noTone(buzzer);
    }
  }
  delay(10);
}
