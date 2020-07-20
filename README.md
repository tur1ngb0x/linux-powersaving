
# Powertop configuration for Linux

Powertop binary script and startup service for extending battery life on laptops running Linux.

### Requirements
* Debian: `sudo apt install git powertop`
* Fedora: `sudo dnf install git powertop`
* Arch: `sudo pacman -S git powertop`

### Power Analysis (Optional)
* Open terminal and type `sudo powertop`.
* Navigate to **Tunables** tab.
    * **Good** = Power saving is enabled.
    * **Bad** = Power saving is disabled.
* Decide which items do you want to blacklist (disable power saving).
* Blacklist devices such as:
    * Wireless/Wired Mouse
    * Keyboard
    * Wi-Fi adapter
* Copy the command(s) printed on the top when you toggle "Bad" state for respective device.

### Download
* `git clone https://github.com/tur1ngb0x/linux-powersaving.git`

### Configure (Optional)
* `cd linux-powersaving`
* Open **pwrtp.sh** with any text editor.
* Add your blacklisted devices if needed.
* Save the file.

### Install
* `cd linux-powersaving`
* `chmod +x install.sh`
* `sudo ./install.sh`

### Verify
* Restart your machine.
* Open terminal and type `sudo powertop`.
* Navigate to **Tunables** tab.
* It should list **Bad** for devices which you have blacklisted and **Good** for rest of the devices.

### Uninstall
Automatically
* `cd linux-powersaving`
* `chmod +x uninstall.sh`
* `sudo ./uninstall.sh`

Manually
* `sudo systemctl stop pwrtp.service`
* `sudo systemctl disable pwrtp.service`
* `sudo rm /etc/systemd/system/pwrtp.service`
* `sudo rm /usr/bin/pwrtp`
* `sudo systemctl daemon-reload`

### Notes
Optimus Laptop (Intel GPU + Nvidia GPU)
* Open source Nvidia drivers (nouveau) do not support power management resulting in increased battery usage and higher idle temperatures.
* Install Nvidia proprietary drivers (nvidia), these support power management.
* Switch to Intel GPU when not doing any GPU intensive tasks such as gaming, deep learning, rendering etc.
