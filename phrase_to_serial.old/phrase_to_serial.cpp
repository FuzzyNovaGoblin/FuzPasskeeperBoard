#include <iostream>
#include <fstream>
#include <thread>
#include <chrono>

using namespace std;

const int WAIT_TIME = 5;

void toggle_active()
{
   ofstream hand("/sys/class/gpio/gpio6/value");
   hand << "1";
   hand.close();
   this_thread::sleep_for(chrono::milliseconds(WAIT_TIME));
   hand.open("/sys/class/gpio/gpio6/value");
   hand << "0";
   hand.close();
   this_thread::sleep_for(chrono::milliseconds(WAIT_TIME));
}



void send_char(char c)
{
   ofstream hand;
   for (int i = 0; i < 8; i++)
   {
      hand.open("/sys/class/gpio/gpio5/value");
      if (c & 128)
      {
         hand << "1";
      }
      else
      {
         hand << "0";
      }
      hand.close();
      toggle_active();
      c <<= 1;
   }
}

void string_to_(string c){

}


int main(int argc, char **argv)
{
   for (int i = 1; i < argc; i++)
   {
      for (int j = 0; j < ((string)argv[i]).length(); j++)
      {
         send_char(argv[i][j]);
      }
   }
}