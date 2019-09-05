#!/bin/bash

source_folder=${PWD} && \

# remove files and create folder
mkdir -p /home/fwrede/musket-build/spfb16/GPU/out/ && \
rm -rf -- ~/build/mnp/spfb16/gpu && \
mkdir -p ~/build/mnp/spfb16/gpu && \

# run cmake
cd ~/build/mnp/spfb16/gpu && \
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Nvprof -D CMAKE_CXX_COMPILER=pgc++ ${source_folder} && \

make spfb16_0 && \
cd ${source_folder} && \

sbatch nvprof-job.sh
