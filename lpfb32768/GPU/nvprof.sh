#!/bin/bash

source_folder=${PWD} && \

# remove files and create folder
mkdir -p /home/fwrede/musket-build/spfb32768/GPU/out/ && \
rm -rf -- ~/build/mnp/spfb32768/gpu && \
mkdir -p ~/build/mnp/spfb32768/gpu && \

# run cmake
cd ~/build/mnp/spfb32768/gpu && \
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Nvprof -D CMAKE_CXX_COMPILER=pgc++ ${source_folder} && \

make spfb32768_0 && \
cd ${source_folder} && \

sbatch nvprof-job.sh
