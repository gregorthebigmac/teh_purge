apt-get install -y curl
apt-get install -y arp-scan
apt-get install -y htop
apt-get install -y openssh-server
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install -y apt-transport-https
apt-get update && sudo apt upgrade
apt-get install -y code
