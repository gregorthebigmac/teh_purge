# list of software to uninstall
sudo apt purge -y aisleriot
sudo apt purge -y brasero
sudo apt purge -y cheese
sudo apt purge -y deja-dup
sudo apt purge -y empathy
sudo apt purge -y evolution
sudo apt purge -y gnome-accessibility-profiles
sudo apt purge -y gnome-accessibility-themes
sudo apt purge -y gnome-calendar
sudo apt purge -y gnome-contacts
sudo apt purge -y gnome-documents
sudo apt purge -y gnome-getting-started-docs
sudo apt purge -y gnome-mahjongg
sudo apt purge -y gnome-maps
sudo apt purge -y gnome-mines
sudo apt purge -y gnome-music
sudo apt purge -y gnome-orca
sudo apt purge -y gnome-online-accounts
sudo apt purge -y gnome-online-miners
sudo apt purge -y gnome-photos
sudo apt purge -y gnome-sudoku
sudo apt purge -y gnome-user-guide
sudo apt purge -y gnome-weather
sudo apt purge -y libreoffice*
sudo apt purge -y rhythmbox
sudo apt purge -y totem

###############################################################################
# WARNING: Removing "caribou" uninstalls pretty much ALL of Gnome, and **WILL**
# break your GUI if you reboot your machine before reinstalling the packages
# listed below! These packages are included in the file install.sh, so you can
# run this script in its entirety, as long as you immediately run install.sh
# afterwards, to avoid breaking Gnome. I also included a break for user input
# just in case you decided not to read this!
#
# Removing caribou removes the following packages along with it:
# gdm3
# gnome-shell
# gnome-shell-extensions
# chrome-gnome-shell
# update-manager
# ubuntu-release-upgrader-gtk
###############################################################################

# If the user passes the -y arg to this script, they know what they're doing,
# let them do it.
if [ $1 == -y]
then
    sudo apt purge -y caribou
    ./install.sh

# If you want the reinstallation of Gnome to be done automatically, you can
# simply uncomment the preceeding line to have this script run install.sh once
# it completes.
#
# Alternatively, you can simply use the following command at the terminal to
# have them run back-to-back:
# $ ./teh_purge.sh && ./install.sh

elif [ -n $1 ]  # If the user does not pass an arg to this script, run this.
then
    echo 'WARNING! Removing the package caribou uninstalls the following packages:'
    echo 'gdm3'
    echo 'gnome-shell'
    echo 'gnome-shell-extensions'
    echo 'chrome-gnome-shell'
    echo 'update-manager'
    echo 'ubuntu-release-upgrader-gtk'
    echo ' '
    echo 'If you don'\''t know why you might not want to do that, then quit now,'
    echo 'read the comments in this script, and come back and decide what you want'
    echo 'to do. If you answer [Y] then the aforementioned packages will be removed.'
    echo 'You have been warned.'
    read -r -p "Are you sure you want to remove caribou? [y/n]" response
    response=${response,,}  # tolower
    if [[ "$response" =~ ^(yes|y)$ ]]
    then
        sudo apt purge -y caribou
    else
        echo 'quitting...'
    fi
# if the user passed any argument to this script besides Y/y/yes, they know what
# they want. Dump out.
else
    echo 'done'
fi
