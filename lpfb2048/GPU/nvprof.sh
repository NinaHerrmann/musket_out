#!/bin/bash

source_folder=${PWD} && \

# remove files and create folder
mkdir -p /home/fwrede/musket-build/spfb2048/GPU/out/ && \
rm -rf -- ~/build/mnp/spfb2048/gpu && \
mkdir -p ~/build/mnp/spfb2048/gpu && \

# run cmake
cd ~/build/mnp/spfb2048/gpu && \
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Nvprof -D CMAKE_CXX_COMPILER=pgc++ ${source_folder} && \

make spfb2048_0 && \
cd ${source_folder} && \

sbatch nvprof-job.sh
