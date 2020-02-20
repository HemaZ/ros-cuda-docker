A simple ROS Kinetic Docker image with OpenGl and CUDA support.

### how to build:
`docker build -t imagename .`


### how to run 
`docker run --runtime=nvidia -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -it imagename`

