#!/bin/bash
ROS_HOST_DIR=/opt/ros/noetic/setup.bash
if [ -z "$1" ]
then
	echo "[ERROR] butuh ip ohmnibot!"
else
	#kita source dulu ROS milik komputer
	source $ROS_HOST_DIR
	#lalu kita source milik catkin.ws ini
	source $PWD/devel/setup.bash

	#lalu set environment variable yang sesuai
	myIP=`hostname -I | awk '{print $1}'`

	echo "[INFO] ROS_MASTER_URI=$1:11311"
	echo "[INFO] ROS_HOSTNAME=$myIP"

	export ROS_MASTER_URI=http://$1:11311
	export ROS_HOSTNAME=$myIP
	export TURTLEBOT3_MODEL=burger
fi

