# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 4.0.0)

# Reject any attempt to use a toolchain file. We must not use one because
# we could be downloading it here. If the CMAKE_TOOLCHAIN_FILE environment
# variable is set, the cache variable will have been initialized from it.
unset(CMAKE_TOOLCHAIN_FILE CACHE)
unset(ENV{CMAKE_TOOLCHAIN_FILE})

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(ext_imgui-populate NONE)



include(ExternalProject)
ExternalProject_Add(ext_imgui-populate
                     "UPDATE_DISCONNECTED" "False" "DOWNLOAD_EXTRACT_TIMESTAMP" "FALSE" "EXTERNALPROJECT_INTERNAL_ARGUMENT_SEPARATOR" "PREFIX" "imgui" "URL" "https://github.com/ocornut/imgui/archive/refs/tags/v1.88.tar.gz" "URL_HASH" "SHA256=9f14c788aee15b777051e48f868c5d4d959bd679fc5050e3d2a29de80d8fd32e" "DOWNLOAD_DIR" "/home/sann/ros_ws/Open3D/3rdparty_downloads/imgui" "UPDATE_COMMAND" ""
                    SOURCE_DIR          "/home/sann/ros_ws/build/Open3D/_deps/ext_imgui-src"
                    BINARY_DIR          "/home/sann/ros_ws/build/Open3D/_deps/ext_imgui-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


