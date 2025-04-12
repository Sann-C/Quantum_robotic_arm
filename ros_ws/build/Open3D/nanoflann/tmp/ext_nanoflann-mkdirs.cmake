# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann")
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann")
endif()
file(MAKE_DIRECTORY
  "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann-build"
  "/home/sann/ros_ws/build/Open3D/nanoflann"
  "/home/sann/ros_ws/build/Open3D/nanoflann/tmp"
  "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann-stamp"
  "/home/sann/ros_ws/Open3D/3rdparty_downloads/nanoflann"
  "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/nanoflann/src/ext_nanoflann-stamp${cfgdir}") # cfgdir has leading slash
endif()
