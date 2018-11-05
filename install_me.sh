sudo apt-get install git -y
sudo apt-get install curl -y
sudo apt-get install arp-scan -y
sudo apt-get install htop -y
sudo apt-get install openssh-server -y
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ -y
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update && sudo apt upgrade -y
sudo apt-get install code -y
