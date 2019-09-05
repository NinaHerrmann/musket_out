# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /software/haswell/CMake/3.11.4-GCCcore-7.3.0/bin/cmake

# The command to remove a file.
RM = /software/haswell/CMake/3.11.4-GCCcore-7.3.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nihe532b/musket-build/mpfb16/CUDA

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark

# Include any dependencies generated for this target.
include CMakeFiles/spfb16_0.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/spfb16_0.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/spfb16_0.dir/flags.make

CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o: CMakeFiles/spfb16_0.dir/flags.make
CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o: ../../src/spfb16_0.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o"
	/sw/installed/CUDA/10.0.130/bin/nvcc  $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -x cu -c /home/nihe532b/musket-build/mpfb16/CUDA/src/spfb16_0.cu -o CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o

CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CUDA source to CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CUDA source to assembly CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target spfb16_0
spfb16_0_OBJECTS = \
"CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o"

# External object files for target spfb16_0
spfb16_0_EXTERNAL_OBJECTS =

CMakeFiles/spfb16_0.dir/cmake_device_link.o: CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o
CMakeFiles/spfb16_0.dir/cmake_device_link.o: CMakeFiles/spfb16_0.dir/build.make
CMakeFiles/spfb16_0.dir/cmake_device_link.o: CMakeFiles/spfb16_0.dir/dlink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CUDA device code CMakeFiles/spfb16_0.dir/cmake_device_link.o"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spfb16_0.dir/dlink.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/spfb16_0.dir/build: CMakeFiles/spfb16_0.dir/cmake_device_link.o

.PHONY : CMakeFiles/spfb16_0.dir/build

# Object files for target spfb16_0
spfb16_0_OBJECTS = \
"CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o"

# External object files for target spfb16_0
spfb16_0_EXTERNAL_OBJECTS =

bin/spfb16_0: CMakeFiles/spfb16_0.dir/src/spfb16_0.cu.o
bin/spfb16_0: CMakeFiles/spfb16_0.dir/build.make
bin/spfb16_0: CMakeFiles/spfb16_0.dir/cmake_device_link.o
bin/spfb16_0: CMakeFiles/spfb16_0.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CUDA executable bin/spfb16_0"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spfb16_0.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/spfb16_0.dir/build: bin/spfb16_0

.PHONY : CMakeFiles/spfb16_0.dir/build

CMakeFiles/spfb16_0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/spfb16_0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/spfb16_0.dir/clean

CMakeFiles/spfb16_0.dir/depend:
	cd /home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nihe532b/musket-build/mpfb16/CUDA /home/nihe532b/musket-build/mpfb16/CUDA /home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark /home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark /home/nihe532b/musket-build/mpfb16/CUDA/build/benchmark/CMakeFiles/spfb16_0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/spfb16_0.dir/depend

