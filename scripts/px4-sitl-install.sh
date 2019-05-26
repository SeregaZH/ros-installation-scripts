#!/usr/bin/bash
# clone px-4 repository

# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

FIRMWARE_BASE_PATH=${1:-'catkin_ws/src/'}
FIRMWARE_PATH='Firmware'

# clone Firmware repository
CURDIR=$PWD
echo_yel "Current directory is $CURDIR, Navigate to $FIRMWARE_BASE_PATH"
cd "$FIRMWARE_BASE_PATH"
if [ -d "$FIRMWARE_PATH" ]
then
    echo_yel "PX4 firmware repository already exists by path $FIRMWARE_PATH. Remove it"
    sudo rm -rf "$FIRMWARE_PATH"
fi

echo_yel "Clone https://github.com/PX4/Firmware.git repository"
sudo git clone https://github.com/PX4/Firmware.git
cd $FIRMWARE_PATH
git submodule update --init --recursive
cd $CURDIR

echo_yel "Install firmware dependencies"
sudo -H apt install python-pip -y
sudo -H apt-get install python-jinja2 -y
sudo -H pip install numpy toml
