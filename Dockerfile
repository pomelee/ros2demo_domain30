FROM ros:dashing-ros-base-bionic

#RUN rm -rf /var/lib/apt/lists/*

# Install Cartographer dependencies
RUN apt-get update && apt install -q -y \
    google-mock \
    libceres-dev \
    liblua5.3-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libcairo2-dev \
    libpcl-dev \
    python3-sphinx \
    net-tools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Install TurtleBot3 dependencies
RUN curl -sSL http://get.gazebosim.org | sh
RUN apt-get update && apt install -q -y \
	ros-dashing-gazebo-* \
    ros-dashing-cartographer \
    ros-dashing-cartographer-ros \
    ros-dashing-navigation2 \
    ros-dashing-nav2-bringup \
    python3-vcstool \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install & Merge Test example TurtleBot3 ROS 2 Packages
RUN /bin/bash -c "source /opt/ros/dashing/setup.bash ;\
                  mkdir -p /turtlebot3_ws/src ;\
                  cd /turtlebot3_ws ;\
                  wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos; \
                  vcs import src < turtlebot3.repos; \
                  colcon build --symlink-install"

# Download demo example
RUN /bin/bash -c "git clone https://github.com/pomelee/ros2demo.git ;\
                  cp ros2demo/src/run_teleoperation.sh . ;\
                  chmod +x teleop_keyboard.py ;\
                  cp ros2demo/src/entrypoint.sh . ;\
                  chmod +x entrypoint.sh ;\
                  cp ros2demo/src/teleop_keyboard.py /turtlebot3_ws/src/turtlebot3/turtlebot3/turtlebot3_teleop/turtlebot3_teleop/script/ ;\
                  chmod +x run_teleoperation.sh"


# setup entrypoint
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash", "./run_teleoperation.sh"]

