#!/usr/bin/env bash

ROS_DISRTO=${1:-'melodic'}

sudo apt-get install -y ros-${ROS_DISRTO}-nodelet \
                        ros-${ROS_DISRTO}-image-transport \
                        ros-${ROS_DISRTO}-dynamic-reconfigure \
                        ros-${ROS_DISRTO}-web-video-server

sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE \
     || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE

if [[ $(lsb_release -rs) == "18.04" ]]
then
    sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
fi

if [[ $(lsb_release -rs) == "16.04" ]]
then
   sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
fi

sudo apt-get update
sudo apt-get install -y librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg