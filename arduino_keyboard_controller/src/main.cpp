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
  // asm()
  pinMode(dataPin, INPUT);
  Keyboard.begin();
}

void loop()
{
  asciiByte = getAsciiByte();
  Serial.println("here");
  Keyboard.print(asciiByte);
}

char getAsciiByte()
{
  Serial.println("here");

  asm("CLR r16"); //char retByte = 0;
  asm("CLR r17");
  // for (int i = 0; i < 8; i++)
  // {
  asm("begin_loop:inc r17\n");

  asm(
      "p5loop_start:\n"
      "sbis %0, %1\n"
      "jmp p5loop_start" ::"I"(_SFR_IO_ADDR(PINC)),
      "I"(PINC6));
  asm("LSL r16");

  asm(
      "p5loop:\n"
      "sbis %0, %1\n"
      "jmp after_bit_set\n"
      "jmp is_high_pin_6\n" ::"I"(_SFR_IO_ADDR(PIND)),
      "I"(PIND7));
  asm("is_high_pin_6:\n");
  asm("ori r16, 0x1");
  asm("after_bit_set:\n");

  asm(
      "p5loop_end:\n"
      "sbis %0, %1\n"
      "jmp p5loop_end" ::"I"(_SFR_IO_ADDR(PINC)),
      "I"(PINC6));
  char retbyte = 0;
  Serial.println((int)retbyte);

  asm("cpi r17, 0x8\n"
      "brlo begin_loop\n");

  // char retbyte = 0;
  asm("mov %0, r16" : "=r"(retbyte));
  Serial.println((int)retbyte);
  return retbyte;
}
