if [ -d "/dev/bus/usb" ]; then
    echo "Running container with usb mapped"
    docker run --rm -it --name phonegap -v $PWD:/data --privileged -v /dev/bus/usb:/dev/bus/usb phonegap:latest /bin/bash
else
    echo "Running container with usb mapped"
    docker run --rm -it --name phonegap -v $PWD:/data phonegap:latest /bin/bash
fi