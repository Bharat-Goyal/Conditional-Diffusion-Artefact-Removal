#!/bin/bash
#SBATCH -J PESQ                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH -c 1
#SBATCH -o arcaLargePESQ-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# python scripts/parse_arca.py --start=0 --end=11572
#11573

srun python scripts/compute_pesq.py --prediction_directory /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/Enhanced/arcaLargeFinal