#!/bin/bash

source_folder=${PWD} && \

# remove files and create folder
mkdir -p /home/nihe532b/musket-build/spfb32768/CUDA/out/ && \
rm -rf -- /home/nihe532b/musket-build/spfb32768/CUDA/build/benchmark && \
mkdir -p /home/nihe532b/musket-build/spfb32768/CUDA/build/benchmark && \

# run cmake
cd /home/nihe532b/musket-build/spfb32768/CUDA/build/benchmark && \
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Benchmarktaurus -D CMAKE_CXX_COMPILER=g++ ${source_folder} && \

make spfb32768_0 && \
cd ${source_folder} && \

sbatch job.sh
