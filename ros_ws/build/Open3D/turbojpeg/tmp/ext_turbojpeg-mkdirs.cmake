# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg")
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg")
endif()
file(MAKE_DIRECTORY
  "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg-build"
  "/home/sann/ros_ws/build/Open3D/turbojpeg"
  "/home/sann/ros_ws/build/Open3D/turbojpeg/tmp"
  "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg-stamp"
  "/home/sann/ros_ws/Open3D/3rdparty_downloads/libjpeg-turbo"
  "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/turbojpeg/src/ext_turbojpeg-stamp${cfgdir}") # cfgdir has leading slash
endif()
