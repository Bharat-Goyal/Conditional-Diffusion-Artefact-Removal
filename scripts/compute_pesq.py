import os
import argparse
from pesq import pesq
from scipy.io import wavfile

def compute_pesq(gt_file, pd_file):
    rate, ref = wavfile.read(gt_file)
    rate, deg = wavfile.read(pd_file)
    pesq_score = pesq(rate, ref, deg, 'wb')
    return pesq_score

def compare_directories(gt_directory, pd_directory):
    gt_files = os.listdir(gt_directory)
    pd_files = os.listdir(pd_directory)

    common_files = set(gt_files) & set(pd_files)

    total_pesq_score = 0
    num_files = len(common_files)

    for file_name in common_files:
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
    parser.add_argument("ground_truth_directory", help="Path to the ground truth directory containing WAV files.")
    parser.add_argument("prediction_directory", help="Path to the prediction directory containing WAV files.")
    args = parser.parse_args()

    compare_directories(args.ground_truth_directory, args.prediction_directory)

if __name__ == "__main__":
    main()
