# arch-install-script
My attempts at automating part of the Arch Linux install process

This is mainly for myself to use. The script makes a few assumptions about the system
that may not be correct for other systems.

# Get scripts from install ISO
Get the scripts with `wget https://raw.githubusercontent.com/tpenders/arch-install-script/master/after-chroot.sh` 
and `wget https://raw.githubusercontent.com/tpenders/arch-install-script/master/install.sh`

# Setup networking
Before running the script an internet connection is needed. I set up my
wireless network with `iwctl --passphrase <key> station wlan0 connect <ssid>`
filling in my network ssid and the key.

# Installing
With a working internet connection run `sh install.sh`. After the
first script has run chroot into the new install with `arch-chroot \mnt` and
then run the second script with `sh after-chroot.sh`. Finally reboot the system.
