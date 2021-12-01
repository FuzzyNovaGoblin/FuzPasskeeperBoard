#include <Arduino.h>
#include "Keyboard.h"

int val = 0;
int activePin = 5;
int dataPin = 6;
bool done = false;
char asciiByte;

char getAsciiByte();

void setup()
{
  pinMode(activePin, INPUT);
  pinMode(dataPin, INPUT);
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
  Serial.println("getAsciiByte");
  char retByte = 0;
  for (int i = 0; i < 8; i++)
  {
    Serial.println((int)retByte);
    while (digitalRead(activePin) == LOW)
    {
      delay(1);
    }
    retByte = retByte << 1;
    if (digitalRead(dataPin) == HIGH)
    {
      retByte = retByte | 1;
    }
    while (digitalRead(activePin) == HIGH)
    {
      delay(1);
    }
  }
  return retByte;
}
