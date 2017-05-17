execute_process(COMMAND "/home/viki/poppy_ros/build/poppy_gazebo/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/viki/poppy_ros/build/poppy_gazebo/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
