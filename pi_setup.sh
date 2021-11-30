#!/bin/bash


cd /sys/class/gpio
echo "5" > export
echo "6" > export
echo "out" > gpio5/direction
echo "out" > gpio6/direction
echo "0" > gpio5/value
echo "0" > gpio6/value
