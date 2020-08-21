#!/bin/bash

read_parameters() {
	bssid=$(cat .current_target.txt)
	output=$(cat .output.txt)
}

wordlists() {
	clear
	echo -e "[${yellow}*${default}] Available wordlists: \n"
	echo -e "[${yellow}0${default}] Custom.\n"
	echo -e "[${yellow}1${default}] WPA-Top62."
	echo -e "[${yellow}2${default}] WPA-Top447."
	echo -e "[${yellow}3${default}] WPA-Top4800."
	echo -ne "\n[${green}+${default}] Enter a wordlist to use in brute-forcing: "
	read wordlist_choice
	case "$wordlist_choice" in
		0)
			echo -ne "[${green}+${default}] Enter the path to wordlist: "
			read wordlist
			;;
		1)
			wordlist=Wordlists/WPA-Top62.txt
			;;
		2)
			wordlist=Wordlists/WPA-Top447.txt
			;;
		3)
			wordlist=Wordlists/WPA-Top4800.txt
			;;
	esac
}

aircrack() {
	echo -e "[${green}+${default}] Press Enter to start brute-forcing (when handshake is captured)."
	read
	cap_file="$output-01.cap"
	aircrack-ng -b $bssid -w $wordlist Output/$output/$cap_file
	restart
}

restart() {
        echo -e -n "\n[${green}*${default}] Operation completed. Press Enter to restart."
        read
	clear
        aircrack
}

        red='\033[0;31m'
        green='\033[0;32m'
        yellow='\033[0;33m'
        default='\033[0;39m'

read_parameters
wordlists
aircrack
