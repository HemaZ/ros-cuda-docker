FROM nvidia/cudagl:10.2-base-ubuntu16.04
LABEL maintainer="Ibrahim Essam <ibrahim.essam1995@gmail.com>"

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update && apt-get install -y --no-install-recommends curl
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-desktop-full
RUN rosdep init && rosdep update
RUN apt install -y python-rosinstall python-rosinstall-generator \ 
    python-wstool build-essential
ENV ROS_DISTRO kinetic
COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]