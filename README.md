# Online Multiplayer Karaoke
This repository provides scripts and setup instructions to enable online multiplayer functionality for karaoke software such as [UltraStar Deluxe](https://usdx.eu) and others by mirroring Mumble channels to virtual microphones using PulseAudio.

## Setting up the server
1. Install Mumble server (Murmur) on a machine featuring a public static IP or domain
1. Identify loaded `.ini` using `service mumble-server status`
1. Set password for _SuperUser_ providing the correct `.ini` path using e.g. `sudo murmurd -ini /etc/mumble-server.ini -supw <your-password>`
1. Log in as _SuperUser_ from any Mumble client
1. Create channels for each virtual microphone configured in `virtual-mic.sh`: _Player1_ and _Player2_

## Starting the system
1. Run `./virtual-mic.sh`
1. Launch UltraStar Deluxe
1. Switch to the _Record_ tab and assign virtual _KaraokeMic1_ to Player 1 and virtual _KaraokeMic2_ to Player 2
1. Open `pavucontrol` and set output of UltraStar Deluxe to _KaraokeOutput_
1. Share `KaraokeOutputShare` with audience
1. Make output locally available with `pactl load-module module-loopback` and select _KaraokeOutput_ for the new loopback device in the playback tab of `pavucontrol`

## For players
1. Install [Plumble](https://play.google.com/store/apps/details?id=com.morlunk.mumbleclient.free&hl=de&gl=US) on your Smartphone or the Mumble client for PC
1. Connect to the server URL provided by your host
1. Select a username of your choice and enter server password if applicable
1. Switch to the channel of your UltraStar Deluxe player
1. Have fun playing!
1. Don't forget to mute or switch channels after your performance

## Credits
This work was made possible with the help of [mic_over_mumble](https://github.com/pzmarzly/mic_over_mumble/blob/master/mic_over_mumble), the [Mumble wiki](https://wiki.mumble.info/) and a lot of testing using `pacmd`.