#!/bin/bash

rm Output/sample.txt
apt-get install -y aircrack-ng terminator net-tools
mkdir /root/.config
mkdir /root/.config/terminator
cp config /root/.config/terminator/config
