#!/bin/bash

splash() {
	clear
	echo -e "${red}.__        _____"
	echo -e '|  |__    /  |  |_____________ ___.__.'
	echo -e '|  |  \  /   |  |\_  __ \____ <   |  |'
	echo -e '|   Y  \/    ^   /|  | \/  |_> >___  |'
	echo -e '|___|  /\____   | |__|  |   __// ____|'
	echo -e '     \/      |__|       |__|   \/'
        echo -e "${red}    Simple WPA/WPA2 PSK attack tool${default}"
	echo -e "${default}                     by: n1x_ ${red}[${default}MS-WEB${red}]${default}\n"
	sleep 2
}

select_interface() {
	echo -e "[${yellow}*${default}] Available network interfaces: \n"
	iwconfig
	echo -ne "\n[${green}+${default}] Enter network interface: "
	read interface
}

monitor_mode() {
	echo -e "[${yellow}*${default}] Eliminating processes that might interfere with the aircrack-ng suite..."
	if airmon-ng check kill; then
		echo -e "[${green}*${default}] Operation completed successfully."
	else
		echo -e "[${red}!${default}] Operation failed!"
		exit 1
	fi
	echo -e "[${yellow}*${default}] Trying to enable monitor mode on selected wireless network interface..."
	ifconfig $interface down
	if iwconfig $interface mode monitor; then
		echo -e "[${green}*${default}] Monitor mode enabled on selected wireless network interface."
	else
		echo -e "[${red}!${default}] Operation failed!"
		exit 1
	fi
	ifconfig $interface up
}

save_interface() {
	echo $interface > .interface.txt
}

airodump() {
	echo -e "[${yellow}*${default}] Scanning the wireless space for networks. Use Ctrl+C to stop the operation when the target is acquired."
	echo -e "[${green}+${default}] Press Enter to continue."
	read
	airodump-ng $interface
	echo -ne "\n[${red}*${default}] Operation stopped. Press any key to restart."
	read
	airodump1
}

airodump1() {
        airodump-ng $interface
        echo -e "[${red}*${default}] Operation stopped. Press Enter to restart."
	read
	airodump1
}

	red='\033[0;31m'
	green='\033[0;32m'
	yellow='\033[0;33m'
	default='\033[0;39m'

splash
select_interface
monitor_mode
save_interface
airodump
