#!/bin/bash

read_interface() {
	interface=$(cat .interface.txt)
}

output_dir_check() {
	if [ -d "Output/$output" ]
		then
			echo -e "[${red}!${default}] Directory already exists!"
			echo -ne "[${green}+${default}] Enter the name for output and the output directory: "
			read output
			output_dir_check
	fi
}

airodump() {
	clear
	echo -ne "[${green}+${default}] Enter the MAC address of access point (BSSID): "
	read bssid
	echo $bssid > .current_target.txt
	echo -ne "[${green}+${default}] Enter the access point channel: "
	read channel
	echo -ne "[${green}+${default}] Enter the name for output and the output directory: "
	read output
	output_dir_check
	mkdir Output/$output
	echo $output > .output.txt
	cd Output/$output
	echo -e "[${green}+${default}] Capturing packets on $bssid. Use Ctrl+C to stop the operation."
	echo -e "[${green}+${default}] Press Enter to continue."
	read
	airodump-ng --bssid $bssid -c $channel -w $output $interface
	echo -e -n "\n[${red}*${default}] Operation stopped. Press Enter to restart."
	read
	cd ../../
	airodump
}

        red='\033[0;31m'
        green='\033[0;32m'
        yellow='\033[0;33m'
        default='\033[0;39m'

read_interface
airodump
