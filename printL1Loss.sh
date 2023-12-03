#!/bin/bash
#SBATCH -J arcaLargeTrainLoss                    # Job name
#SBATCH -n 1                                    # Number of cores required
#SBATCH --gres=gpu:4
#SBATCH -c 16
#SBATCH -t 4:00:00                              
#SBATCH -o arcaLargeTrainLoss-%j.out                         # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL              # Mail preferences
#SBATCH --mail-user=bgoyal7@gatech.edu        # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                            # Change to working directory

source ~/.bashrc
# # module load anaconda3/2022.05.0.1                   # Load module dependencies
conda activate cdiff
# # python scripts/parse_arca.py --start=0 --end=11572
# #11573

# ./train.sh 2 arcaLarge40 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge2/weights-4725.pt
# echo "done with 40"
# ./train.sh 2 arcaLarge80 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge3/weights-7425.pt
# echo "done with 80"
# ./train.sh 2 arcaLarge120 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge4/weights-11475.pt
# echo "done with 120"
# ./train.sh 2 arcaLarge160 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge5/weights-16200.pt
# echo "done with 160"
# ./train.sh 2 arcaLarge200 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge6/weights-20925.pt
# echo "done with 200"
# ./train.sh 2 arcaLarge241 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaLarge7/weights-24300.pt
# echo "done with 241"

./train.sh 2 arcaAugmented50 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented1/weights-33750.pt
./train.sh 2 arcaAugmented100 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented2/weights-29700.pt
./train.sh 2 arcaAugmented150 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented3/weights-22275.pt
./train.sh 2 arcaAugmented200 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented4/weights-18225.pt
./train.sh 2 arcaAugmented250 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented5/weights-10800.pt
./train.sh 2 arcaAugmented300 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented6/weights-6750.pt
./train.sh 2 arcaAugmented350 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented7/weights-675.pt
./train.sh 2 arcaAugmented400 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented7/weights-34425.pt
./train.sh 2 arcaAugmented450 /home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/arcaAugmented8/weights-28350.pt


 