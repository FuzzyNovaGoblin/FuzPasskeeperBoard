#include <Arduino.h>
#include "Keyboard.h"

int val = 0;
int activePin = 5;
int dataPin = 6;
bool done = false;
char asciiByte;

void setup()
{
  pinMode(activePin, INPUT);
  pinMode(dataPin, INPUT);
  pinMode(dataPin, 5);
  Keyboard.begin();
}

void loop()
{
  asciiByte = getAsciiByte();
  Keyboard.print(asciiByte);
  // Serial.print("val: ");
  // Serial.println(val);

  // delay(1000);
  // if (!done)
  // {
  //   done = true;
  //   // Keyboard.press(97);
  //   delay(100);
  //   // Keyboard.release(97);
  //   Keyboard.print("a");
  // }
  // if(val != 0){
  //   Keyboard.print("a");
  // }
}

char getAsciiByte()
{
  char retByte = 0;
  for (int i = 0; i < 8; i++)
  {

  }
  return retByte;
}