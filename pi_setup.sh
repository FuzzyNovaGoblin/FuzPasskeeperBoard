#!/bin/bash


cd /sys/class/gpio
sudo echo "5" > export
sudo echo "6" > export
sudo echo "out" > gpio5/direction
sudo echo "out" > gpio6/direction
sudo echo "0" > gpio5/value
sudo echo "0" > gpio6/value

cd /home/pi
sudo -u pi flutter-pi FuzPasskeeperBoard_bundle