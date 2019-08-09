#!/bin/bash

source_folder=${PWD} && \

# remove files and create folder
mkdir -p /home/nihe532b/musket-build/spfb64/CUDA/out/ && \
rm -rf -- ~/build/mnp/spfb64/cuda && \
mkdir -p ~/build/mnp/spfb64/cuda && \

# run cmake
cd ~/build/mnp/spfb64/cuda && \
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Nvprof -D CMAKE_CXX_COMPILER=g++ ${source_folder} && \

make spfb64_0 && \
cd ${source_folder} && \

sbatch nvprof-job.sh
