#!/bin/bash
#SBATCH --job-name spfb2048-GPU-nvprof-nodes-1-gpu-1
#SBATCH --ntasks 1
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --partition gpu2
#SBATCH --exclusive
#SBATCH --output /home/nihe532b/musket-build/spfb2048/CUDA/out/spfb2048-nvprof-nodes-1-gpu-1.out
#SBATCH --cpus-per-task 24
#SBATCH --mail-type ALL
#SBATCH --mail-user fabian.wrede@mailbox.tu-dresden.de
#SBATCH --time 01:00:00
#SBATCH -A p_algcpugpu
#SBATCH --gres gpu:4

export OMP_NUM_THREADS=24

RUNS=1
for ((i=1;i<=RUNS;i++)); do
	srun nvprof /home/fwrede/out/mnp/spfb2048-cuda-%p.out /home/fwrede/build/mnp/spfb2048/cuda/bin/spfb2048_0
done
