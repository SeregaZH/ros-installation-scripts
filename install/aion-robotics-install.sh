#!/usr/bin/env bash
# clone aion robotic repository

# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

BASE_DIR=${1:-'/home/main'}
AION_DIR=${2:-'aion'}

CURDIR=$PWD
echo_yel "Current directory is $CURDIR, Navigate to $BASE_DIR"

cd ${BASE_DIR}
if [[ -d "$AION_DIR" ]]
then
    echo_yel "AION directory exists. Remove it"
    sudo rm -rf "$AION_DIR"
fi

sudo mkdir ${AION_DIR}
cd ${AION_DIR}

sudo git clone https://github.com/SeregaZH/aion_io.git
cd aion_io
sudo git submodule update --init --recursive
sudo /bin/bash -c 'source /opt/ros/melodic/setup.bash; catkin_make'

cd ${CURDIR}