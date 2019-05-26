#!/usr/bin/bash
# install core of ROS

# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

# keyserver for apt keys
KEY_SERVER=${2:-'hkp://ha.pool.sks-keyservers.net:80'} # possible values hkp://pgp.mit.edu:80 or hkp://keyserver.ubuntu.com:80
KEY=${3:-421C365BD9FF1F717815A3895523BAEEB01FA116}
MODE=${1:-full-dsk} #options: dsk, base

# check bash parameters
echo_yel ${MODE}
echo_yel ${KEY}
echo_yel ${KEY_SERVER}

#  Setup your computer to accept software from packages.ros.org.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt-key adv --keyserver ${KEY_SERVER} --recv-key ${KEY}

sudo apt update

case ${MODE} in
    full-dsk)
        echo 'FULL'
        sudo apt install ros-melodic-desktop-full -y
        ;;
    dsk)
        echo 'DSK'
        sudo apt install ros-melodic-desktop -y
        ;;
    base)
        echo 'BASE'
        sudo apt install ros-melodic-desktop-base -y
        ;;
esac

# install rosdep for dependency management
sudo rosdep init
rosdep update

# add to bash
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

#install mavros
sudo apt-get install -y ros-melodic-mavros ros-melodic-mavros-extras
wget -q -O - https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash -

# install build tools for ros
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
