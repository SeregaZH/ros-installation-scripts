#!/usr/bin/env bash

# clone ardupilot plugin repository
# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

BASE_DIR=${1:-'/home/main'}
ARDU_DIR=${2:-'ardupilot'}
ARDU_SIM_DIR=${3:-'ardupilot_gazebo'}

CURDIR=$PWD
echo_yel "Current directory is $CURDIR, Navigate to $BASE_DIR"

cd "$BASE_DIR"
if [[ -d "$ARDU_DIR" ]]
then
    echo_yel "Ardupilot repository already exists by path $ARDU_DIR. Remove it"
    sudo rm -rf "$ARDU_DIR"
fi
if [[ -d "$ARDU_SIM_DIR" ]]
then
    echo_yel "Ardu simulation repository already exists by path $ARDU_SIM_DIR. Remove it"
    sudo rm -rf "$ARDU_SIM_DIR"
fi

echo_yel "Clone https://github.com/ArduPilot/ardupilot.git repository"
sudo git clone https://github.com/ArduPilot/ardupilot.git
cd ${ARDU_DIR}
sudo git submodule update --init --recursive
sudo bash Tools/environment_install/install-prereqs-ubuntu.sh -y
cd ..

echo_yel "Clone https://github.com/khancyr/ardupilot_gazebo repository"
sudo git clone https://github.com/khancyr/ardupilot_gazebo
cd ${ARDU_SIM_DIR}
sudo mkdir build
cd build
sudo cmake ..
sudo make -j4
sudo make install
cd ${CURDIR}

# install package required for simulation
sudo -H apt install python-pip -y
sudo -H pip install future
sudo -H pip install MAVproxy