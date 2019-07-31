#!/usr/bin/env bash

# install core of ROS
# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

# keyserver for apt keys
KEY_SERVER=${2:-'hkp://keyserver.ubuntu.com:80'} # possible values hkp://pgp.mit.edu:80 or hkp://keyserver.ubuntu.com:80
KEY=${3:-C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654}
MODE=${4:-full-dsk} #options: dsk, base
ROS_DISRTO=${1:-'melodic'}

# check bash parameters
echo_yel ${MODE}
echo_yel ${KEY}
echo_yel ${KEY_SERVER}

#  Setup your computer to accept software from packages.ros.org.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver ${KEY_SERVER} --recv-key ${KEY}

sudo apt update
sudo apt-get update

case ${MODE} in
    full-dsk)
        echo 'FULL'
        sudo apt-get install ros-${ROS_DISRTO}-desktop-full -y
        ;;
    dsk)
        echo 'DSK'
        sudo apt-get install ros-${ROS_DISRTO}-desktop -y
        ;;
    base)
        echo 'BASE'
        sudo apt-get install ros-${ROS_DISRTO}-desktop-base -y
        ;;
esac

# install rosdep for dependency management
sudo rosdep init
rosdep update

# add to bash
echo "source /opt/ros/${ROS_DISRTO}/setup.bash" >> ~/.bashrc
source ~/.bashrc

#install mavros
sudo apt-get install -y ros-${ROS_DISRTO}-mavros ros-${ROS_DISRTO}-mavros-extras
wget -q -O - https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash -

# install build tools for ros
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
