#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/dashing/setup.bash"

# setup turtlebot environment
source "/turtlebot3_ws/install/setup.bash"
export ROS_DOMAIN_ID=30
export TURTLEBOT3_MODEL=burger

exec "$@"
