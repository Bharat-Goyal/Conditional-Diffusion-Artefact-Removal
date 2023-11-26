import os, librosa
import argparse
from pesq import pesq
from scipy.io import wavfile

from tqdm import tqdm

def compute_pesq(gt_file, pd_file):
    ref, rate  = librosa.load(gt_file, sr=16000)
    deg, rate = librosa.load(pd_file, sr=16000)
    pesq_score = pesq(rate, ref, deg, 'wb')
    return pesq_score

def compare_directories(gt_directory, pd_directory):
    gt_files = os.listdir(gt_directory)
    pd_files = os.listdir(pd_directory)

    common_files = set(gt_files) & set(pd_files)

    total_pesq_score = 0
    num_files = len(common_files)

    for file_name in tqdm(common_files):
        gt_file_path = os.path.join(gt_directory, file_name)
        pd_file_path = os.path.join(pd_directory, file_name)

        pesq_score = compute_pesq(gt_file_path, pd_file_path)
        total_pesq_score += pesq_score

        print(f"PESQ score for {file_name}: {pesq_score}")

    if num_files > 0:
        average_pesq_score = total_pesq_score / num_files
        print(f"\nAverage PESQ score across {num_files} files: {average_pesq_score}")
    else:
        print("No common files found.")

def main():
    parser = argparse.ArgumentParser(description="Compare PESQ scores between ground truth and prediction audio files.")
    parser.add_argument("--ground_truth_directory", default = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/voicebank/clean_testset_wav',
                        help="Path to the ground truth directory containing WAV files.")
    parser.add_argument("--prediction_directory", default = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/Enhanced/arcaAugmentedFinal/model35100/test/voicebank_Noisy_Test',
                        help="Path to the prediction directory containing WAV files.")
    args = parser.parse_args()

    compare_directories(args.ground_truth_directory, args.prediction_directory)

if __name__ == "__main__":
    main()
