#!/bin/bash

rm Output/sample.txt
if [ -x "$(command -v pacman)" ]; then
	pacman -Sy aircrack-ng terminator net-tools
elif [ -x "$(command -v apt)" ]; then
	apt install aircrack-ng terminator net-tools
fi
mkdir /root/.config
mkdir /root/.config/terminator
cp config /root/.config/terminator/config
