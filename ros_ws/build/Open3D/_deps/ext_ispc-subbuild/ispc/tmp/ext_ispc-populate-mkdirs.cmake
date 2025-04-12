# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-src")
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-src")
endif()
file(MAKE_DIRECTORY
  "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-build"
  "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc"
  "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc/tmp"
  "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc/src/ext_ispc-populate-stamp"
  "/home/sann/ros_ws/Open3D/3rdparty_downloads/ispc"
  "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc/src/ext_ispc-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc/src/ext_ispc-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/sann/ros_ws/build/Open3D/_deps/ext_ispc-subbuild/ispc/src/ext_ispc-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
