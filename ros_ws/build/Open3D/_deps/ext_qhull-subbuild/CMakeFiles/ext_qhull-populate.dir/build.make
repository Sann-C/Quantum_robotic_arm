# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild

# Utility rule file for ext_qhull-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/ext_qhull-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ext_qhull-populate.dir/progress.make

CMakeFiles/ext_qhull-populate: CMakeFiles/ext_qhull-populate-complete

CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-mkdir
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-build
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install
CMakeFiles/ext_qhull-populate-complete: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'ext_qhull-populate'"
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E make_directory /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles/ext_qhull-populate-complete
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-done

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-build: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'ext_qhull-populate'"
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-build

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure: qhull/tmp/ext_qhull-populate-cfgcmd.txt
qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'ext_qhull-populate'"
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download: qhull/src/ext_qhull-populate-stamp/download-ext_qhull-populate.cmake
qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-urlinfo.txt
qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'ext_qhull-populate'"
	cd /home/sann/ros_ws/build/Open3D/_deps && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/download-ext_qhull-populate.cmake
	cd /home/sann/ros_ws/build/Open3D/_deps && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/verify-ext_qhull-populate.cmake
	cd /home/sann/ros_ws/build/Open3D/_deps && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/extract-ext_qhull-populate.cmake
	cd /home/sann/ros_ws/build/Open3D/_deps && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'ext_qhull-populate'"
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'ext_qhull-populate'"
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -Dcfgdir= -P /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/tmp/ext_qhull-populate-mkdirs.cmake
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-mkdir

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch-info.txt
qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'ext_qhull-populate'"
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-test: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'ext_qhull-populate'"
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-build && /home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-test

qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update-info.txt
qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "No update step for 'ext_qhull-populate'"
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E echo_append
	/home/sann/anaconda3/lib/python3.11/site-packages/cmake/data/bin/cmake -E touch /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update

CMakeFiles/ext_qhull-populate.dir/codegen:
.PHONY : CMakeFiles/ext_qhull-populate.dir/codegen

ext_qhull-populate: CMakeFiles/ext_qhull-populate
ext_qhull-populate: CMakeFiles/ext_qhull-populate-complete
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-build
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-configure
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-download
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-install
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-mkdir
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-patch
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-test
ext_qhull-populate: qhull/src/ext_qhull-populate-stamp/ext_qhull-populate-update
ext_qhull-populate: CMakeFiles/ext_qhull-populate.dir/build.make
.PHONY : ext_qhull-populate

# Rule to build all files generated by this target.
CMakeFiles/ext_qhull-populate.dir/build: ext_qhull-populate
.PHONY : CMakeFiles/ext_qhull-populate.dir/build

CMakeFiles/ext_qhull-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ext_qhull-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ext_qhull-populate.dir/clean

CMakeFiles/ext_qhull-populate.dir/depend:
	cd /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild /home/sann/ros_ws/build/Open3D/_deps/ext_qhull-subbuild/CMakeFiles/ext_qhull-populate.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/ext_qhull-populate.dir/depend

