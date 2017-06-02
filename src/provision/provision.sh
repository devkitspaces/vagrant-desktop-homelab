#!/bin/bash
start="$(date +%s)"

echo "Provisioning Environment"
echo "-----------------------------"
echo "Installing keys..."
add-apt-repository ppa:eugenesan/ppa -y
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

echo "-----------------------------"
echo "Installing libraries..."
apt-get -y install cmake make g++ git pkg-config libx11-dev mesa-common-dev libglu1-mesa-dev libxrandr-dev libxi-dev

echo "-----------------------------"
echo "Installing software..."
apt-get -y update
apt-get -y install smartgithg firefox google-chrome-stable

end="$(date +%s)"
echo "-----------------------------"
echo "Provisioning complete in "$(expr $end - $start)" seconds"