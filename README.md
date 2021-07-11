
# powertop-autostart

Powertop bash script and systemd startup service for extending battery life on laptops running Linux.

### Requirements
* APT (Debian/Ubuntu/Mint/Pop!_OS)
    * `sudo apt update`
    * `sudo apt install git powertop`
* DNF (RHEL/CentOS/Fedora)
    * `sudo dnf upgrade`
    * `sudo dnf install git powertop`
* PACMAN (Arch/Manjaro)
    * `sudo pacman -Syu`
    * `sudo pacman -S git powertop`

### Power Analysis (Optional)
* Open a terminal and type `sudo powertop`.
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
* Open `pwrtp.sh` with any text editor.
* In the "**block-devices**" section of the script, add your device path as mentioned in the example template.
* Save the file.

### Install (as root)
* `cd powertop-autostart`
* `chmod +x ./install.sh`
* `./install.sh`

### Verify
* Restart your machine.
* Open terminal and type `sudo powertop`.
* Navigate to **Tunables** tab.
* It should show
    * **Bad** for devices for which you have disabled power savings.
    * **Good** for rest of the devices.

### Uninstall (as root)
* `cd powertop-autostart`
* `chmod +x ./uninstall.sh`
* `./uninstall.sh`

### Notes
* Do not use `tlp` and `powertop --auto-tune` simultaneously as it will conflict the power settings. You can use any one of the following combination for power management.
    * `tlp` for power-saving + `powertop` for just for checking power consumption and CPU stats.
    * This script for everything.
* Hybrid Graphics Laptop Users : Integrated (Intel/AMD) GPU + Nvidia Dedicated GPU
	* Open source Nvidia drivers `nouveau` do not support power management resulting in increased battery usage and higher idle temperatures. It also may cause screen tearing on some machines.
	* Proprietary Nvidia drivers `nvidia` are recommended for installation from your distro repos, these drivers support power management and have better performance.
    * Switch to Integrated GPU when not doing any dedicated GPU intensive tasks such as gaming, deep learning, rendering etc.
    * If you do not use Nvidia GPU on Linux:
        * Method 1 (Recommended) : Some laptops have an option to switch off Nvidia GPU from the laptop's BIOS/UEFI settings. This turns off power to Nvidia GPU completely.
        * Method 2 : Using `system76-power` package. This blacklists `nouveau` and `nvidia` module and turns off the Nvidia GPU completely.
            * My Auto Install Script : https://github.com/tur1ngb0x/stuff/blob/main/linux/scripts/system76-power.sh
            * Github : https://github.com/pop-os/system76-power
            * PPA : https://launchpad.net/~system76-dev/+archive/ubuntu/stable
            * COPR : https://copr.fedorainfracloud.org/coprs/szydell/system76/
            * AUR : https://aur.archlinux.org/packages/system76-power            
        * Method 3 (If all of the above methods fail) : Pass these parameters to the kernel
            ```
            modprobe.blacklist=nouveau modprobe.blacklist=nvidia
            ```
            Regenerate your `grub2` / `systemd-boot` / `refind` configuration file including `initramfs` and immediately reboot for changes to take effect. This blacklists `nouveau` and `nvidia` modules, but does not turn off the Nvidia GPU.
