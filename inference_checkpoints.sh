#!/bin/bash
#SBATCH -J XTInference                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o XTInference-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# python scripts/parse_arca.py --start=0 --end=11572
#11573

# srun ./inference.sh 2 conditionOnXTFinal 450 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented8/weights-28350.pt
git checkout ModifiedVB
# srun ./inference.sh 2 conditionOnXTFinal 40 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/conditionOnXT2/weights-5400.pt
srun ./inference.sh 2 conditionOnXTFinal 80 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/conditionOnXT3/weights-10800.pt
srun ./inference.sh 2 conditionOnXTFinal 120 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/conditionOnXT4/weights-16200.pt
srun ./inference.sh 2 conditionOnXTFinal 160 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/conditionOnXT5/weights-20250.pt