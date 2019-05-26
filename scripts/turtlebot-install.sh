# script parameters
CATKIN_TURTLE_PATH=${1:-'catkin_ws'}

sudo apt-get install -y ros-melodic-joy \
      ros-melodic-teleop-twist-joy \
      ros-melodic-teleop-twist-keyboard \
      ros-melodic-laser-proc \
      ros-melodic-rgbd-launch \
      ros-melodic-depthimage-to-laserscan \
      ros-melodic-rosserial-arduino \
      ros-melodic-rosserial-python \
      ros-melodic-rosserial-server \
      ros-melodic-rosserial-client \
      ros-melodic-rosserial-msgs \
      ros-melodic-amcl \
      ros-melodic-map-server \
      ros-melodic-move-base \
      ros-melodic-urdf \
      ros-melodic-xacro \
      ros-melodic-compressed-image-transport \
      ros-melodic-rqt-image-view \
      ros-melodic-navigation \
      ros-melodic-interactive-markers

CURDIR=$PWD

# clone turtlebot3 repositories to src directory
SRC_PATH="$CATKIN_TURTLE_PATH/src"
echo $SRC_PATH
if [[ -d "$SRC_PATH" ]]
then
    sudo rm -rf "$SRC_PATH"
fi

sudo mkdir -p ${SRC_PATH}
cd ${SRC_PATH}
sudo git clone https://github.com/OpenSLAM-org/openslam_gmapping.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ..
echo $PWD
# build turtlebot3
sudo /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make"
cd ${CURDIR}