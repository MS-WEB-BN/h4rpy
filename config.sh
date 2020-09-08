#!/bin/bash

rm Output/sample.txt
apt-get install -y aircrack-ng
apt-get install -y terminator
mkdir /root/.config
mkdir /root/.config/terminator
cp config /root/.config/terminator/config
