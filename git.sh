#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Erik Dubois
# Website 	: 	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

buildFolder=$HOME"/arcolinux-build"
outFolder=$HOME"/ArcoLinux-Out"
workdir=$(pwd)
echo "getting latest .bashrc"
wget https://raw.githubusercontent.com/arcolinux/arcolinux-root/master/etc/skel/.bashrc-latest -O $workdir/usr/local/share/arcolinux/.bashrc
echo "getting latest /etc/sddm.conf"
wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/sddm.conf -O $workdir/usr/local/share/arcolinux/sddm.conf
FIND="Session=xfce"
REPLACE="#Session="
sed -i "s/$FIND/$REPLACE/g" $workdir/usr/local/share/arcolinux/sddm.conf

FIND="User=liveuser"
REPLACE="#User="
sed -i "s/$FIND/$REPLACE/g" $workdir/usr/local/share/arcolinux/sddm.conf


wget https://raw.githubusercontent.com/arcolinux/arcolinux-mirrorlist/master/etc/pacman.d/arcolinux-mirrorlist -O $workdir/usr/local/share/arcolinux/arcolinux-mirrorlist




# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

git push -u origin master


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
