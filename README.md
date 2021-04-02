# h4rpy
**h4rpy** is an automated WPA/WPA2 PSK attack tool, wrapper of [aircrack-ng framework](https://github.com/aircrack-ng/aircrack-ng).

**h4rpy** provides clean interface for automated cracking of WPA/WPA2 PSK networks. **h4rpy** enables monitor mode on selected wireless interface, scans the wireless space for access points, tries to capture WPA/WPA2 4-way handshake for the acess point, and starts a dictionary attack on the handshake. It is also possible to send disassociate packets to clients associated with access point.

# Installation:
Installation consists of cloning the repo, running a script that will install dependencies ([aircrack-ng framework](https://github.com/aircrack-ng/aircrack-ng) and [Terminator](https://code.launchpad.net/terminator/) are required in order to run **h4rpy**), or installing them manually, and making **h4rpy** executable. Installation script works with apt and pacman package managers (Debian and Arch). 
```
# git clone https://github.com/MS-WEB-BN/h4rpy/
# cd h4rpy
# sudo bash config.sh
# sudo chmod +x h4rpy
```

# Usage:
To run h4rpy:
```
# sudo ./h4rpy
```
**Top-left**: Enabling monitor mode, scanning for access points (packet capturing of raw 802.11 frames);

**Top-right**: Packet capturing on selected wireless network, capturing the WPA/WPA2 4-way handshake;

**Bottom-left**: Sends disassocate packets to clients which are currently associated with a selected access point;

**Bottom-right**: Dictionary attack on the captured WPA/WPA2 4-way handshake.

# Screenshots:
![Start](https://i.ibb.co/NZY0rNp/harpy-1.png)
![Cracked](https://i.ibb.co/TYQFd8X/harpy-2.png)

# License:

The software is free to use, modify and distribute, as long as the credit is given to the creator (***n1x_ [[MS-WEB]](https://www.ms-web.agency/)***).

# Disclaimer:

Any actions and/or activities done by using **h4rpy** are solely your responsibility. The misuse of **h4rpy** can result in criminal charges brought against the persons in question. The author will not be held responsible in the event any criminal charges be brought against any individuals misusing **h4rpy** to break the law.

# Contribution note:

Each of the scripts/tools/programs hosted here are made as a part of [MS-WEB](https://www.ms-web.agency/)s cyber security courses, aimed toward beginners, therefore are purely educational and/or demonstrational, and are meant to stay that way, even if wider audience and real world usage are reached. All pauses present in code are there so that the user can read the output, so the action that is running is understood.

All pull requests removing such pauses, or parts of output are against the educational purpose, and will not be accepted.
