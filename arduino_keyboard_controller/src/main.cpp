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
}

char getAsciiByte()
{
  char retByte = 0;
  for (int i = 0; i < 8; i++)
  {
      asm(
      "p5loop_start:\n"
      "sbis %0, %1\n"
      "jmp p5loop_start" ::"I"(_SFR_IO_ADDR(PINC)),
      "I"(PINC6));
    retByte = retByte << 1;
    if (digitalRead(dataPin) == HIGH)
    {
      retByte = retByte | 1;
    }
    asm(
        "p5loop_end:\n"
        "sbic %0, %1\n"
        "jmp p5loop_end" ::"I"(_SFR_IO_ADDR(PINC)),
        "I"(PINC6));
  }
  return retByte;
}