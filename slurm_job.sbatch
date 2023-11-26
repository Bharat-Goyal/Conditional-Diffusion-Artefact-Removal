#!/bin/bash
#SBATCH -J TrainFromScratch                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o TrainFromScratch-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# python scripts/parse_arca.py --start=0 --end=11572
#11573
# srun ./inference.sh 2 arcaAugmentedFinal 50 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented1/weights-33750.pt
srun ./inference.sh 2 arcaAugmentedFinal 100 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented2/weights-29700.pt
srun ./inference.sh 2 arcaAugmentedFinal 150 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented3/weights-22275.pt
srun ./inference.sh 2 arcaAugmentedFinal 200 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented4/weights-18225.pt
srun ./inference.sh 2 arcaAugmentedFinal 250 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented5/weights-10800.pt
srun ./inference.sh 2 arcaAugmentedFinal 300 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented6/weights-6750.pt
srun ./inference.sh 2 arcaAugmentedFinal 350 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented7/weights-675.pt
srun ./inference.sh 2 arcaAugmentedFinal 400 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented7/weights-34425.pt
srun ./inference.sh 2 arcaAugmentedFinal 450 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented8/weights-28350.pt