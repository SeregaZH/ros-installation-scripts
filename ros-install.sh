#!/bin/bash
# install core of ROS

# keyserver for apt keys
KEY_SERVER='hkp://ha.pool.sks-keyservers.net:80' # possible values hkp://pgp.mit.edu:80 or hkp://keyserver.ubuntu.com:80
KEY=421C365BD9FF1F717815A3895523BAEEB01FA116
MODE='full-dsk' #options: dsk, base

#  Setup your computer to accept software from packages.ros.org. 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt-key adv --keyserver $KEY_SERVER --recv-key $KEY

sudo apt update

case $MODE in
    full-dsk)
        echo 'FULL'
        sudo apt install ros-melodic-desktop-full
        ;;
    dsk)
        echo 'DSK'
        sudo apt install ros-melodic-desktop
        ;;
    base)
        echo 'BASE'
        sudo apt install ros-melodic-desktop-base
        ;;
esac

# install rosdep for dependency management
sudo rosdep init
rosdep update

# add to bash
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# install build tools for ros
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
