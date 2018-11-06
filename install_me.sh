sudo apt-get install -y gdm3
sudo apt-get install -y chrome-gnome-shell
sudo apt-get install -y gnome-shell-extensions
sudo apt-get install -y update-notifier
sudo apt-get install -y gnome-shell
sudo apt-get install -y update-manager
sudo apt-get install -y ubuntu-release-upgrader-gtk
sudo apt-get install -y curl
sudo apt-get install -y arp-scan
sudo apt-get install -y htop
sudo apt-get install -y openssh-server
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install -y apt-transport-https
sudo apt-get update && sudo apt upgrade
sudo apt-get install -y code
