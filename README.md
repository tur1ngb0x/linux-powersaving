
# Powertop configuration for Linux

Powertop binary script and startup service for extending battery life on laptops running Linux.

### Requirements
Make sure you have updated the system fully.
* Debian: `sudo apt install git powertop`
* Fedora: `sudo dnf install git powertop`
* Arch: `sudo pacman -S git powertop`

### Power Analysis (Optional)
* Open terminal and type `sudo powertop`.
* Navigate to **Tunables** tab.
    * **Good** = Power saving is enabled.
    * **Bad** = Power saving is disabled.
* We will need path of the device in order to blacklist it.
* **NOTE**: All USB devices are blacklisted by default, if they arent, you might need to below steps.
* Make a list of devices for which you want to disable power savings, such as:
	* External HDD/SSD
    * Wireless/Wired Mouse
    * Wireless/Wired Keyboard
    * Wi-Fi Adapter
    * Ethernet
* Toggle "Bad" state for respective device(s) and copy the command(s) printed on the top.



### Download
* `git clone https://github.com/tur1ngb0x/powertop-autostart.git`

### Configure (Optional)
* `cd powertop-autostart`
* Open **pwrtp.sh** with any text editor.
* In the "**block-devices**" section of the script, add your device path as mentioned in the example template.
* Save the file.

### Install
* `cd powertop-autostart`
* `chmod +x install.sh`
* `sudo ./install.sh`

### Verify
* Restart your machine.
* Open terminal and type `sudo powertop`.
* Navigate to **Tunables** tab.
* It should show
    * **Bad** for devices for which you have disabled power savings.
    * **Good** for rest of the devices.

### Uninstall
Automatically
* `cd powertop-autostart`
* `chmod +x uninstall.sh`
* `sudo ./uninstall.sh`

Manually
* `sudo systemctl stop pwrtp.service`
* `sudo systemctl disable pwrtp.service`
* `sudo rm /etc/systemd/system/pwrtp.service`
* `sudo rm /usr/bin/pwrtp.sh`
* `sudo systemctl daemon-reload`

### Notes
* Do not use TLP and `powertop --auto-tune` simultaneously as it will conflict the power settings. You can use any one of the following combination for power management.
    * TLP + Powertop just for checking power consumption and CPU stats.
    * Powertop using `powertop --auto-tune`
* Optimus Laptop Users (Intel iGPU + Nvidia dGPU)
	* Open source Nvidia drivers (nouveau) do not support power management resulting in increased battery usage and higher idle temperatures. It also may cause screen tearing in some setups.
	* Install latest (stable and tested) Nvidia proprietary drivers (nvidia) from your distro repos, these drivers support power management.
	* Switch to Intel iGPU when not doing any GPU intensive tasks such as gaming, deep learning, rendering etc.
    * If you do not use or need Nvidia GPU on Linux, pass "modprobe.blacklist=nouveau modprobe.blacklist=nvidia" as kernel parameters. This will disable these modules from loading at every system boot.
