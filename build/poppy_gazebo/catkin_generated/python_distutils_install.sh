#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/viki/poppy_ros/src/poppy_gazebo"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/viki/poppy_ros/install/lib/python2.7/dist-packages:/home/viki/poppy_ros/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/viki/poppy_ros/build" \
    "/usr/bin/python" \
    "/home/viki/poppy_ros/src/poppy_gazebo/setup.py" \
    build --build-base "/home/viki/poppy_ros/build/poppy_gazebo" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/viki/poppy_ros/install" --install-scripts="/home/viki/poppy_ros/install/bin"
