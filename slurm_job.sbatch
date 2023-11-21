#!/bin/bash
#SBATCH -J TestInferenceJob                    # Job name
#SBATCH -n1                                     # Number of cores required
#SBATCH -c 4
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=1G                        # Memory per core
#SBATCH -o Report-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
echo "conda command works"
srun ./inference.sh 2 origfrompretrained 675 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/origfrompretrained/weights-675.pt                            # Example Process
