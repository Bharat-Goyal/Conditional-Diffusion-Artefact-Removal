from argparse import ArgumentParser
from glob import glob
import librosa,os
import numpy as np
import csv
import random
import torchaudio, torch
import soundfile as sf
import random

def main(args):
    os.path.join(args.voicebank_clean, 'clean_trainset_28spk_wav')
    all_vb = glob(f'{args.voicebank_clean}/clean_trainset_28spk_wav/*.wav', recursive=True)
    all_vb = sorted(all_vb)
    output_dir = os.path.join(args.voicebank_clean, 'noisy_trainset_28spk_wav')
    # Parse the CSV file
    csv_file = f'{args.arka23k_dir}/ARCA23K.ground_truth/train.csv'
    files_by_label = {}
    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            if row[1] == 'label':
                continue
            if row[1] not in files_by_label:
                files_by_label[row[1]] = []
            files_by_label[row[1]].append(args.arka23k_dir+'/ARCA23K.audio/'+row[0]+'.wav')
    # for (label, files) in files_by_label.items():
    #     print(f'{label}: {len(files)}')
    labels = sorted(list(files_by_label.keys()))
    for i in range(args.start, args.end):
        x = os.path.join(output_dir, 'scaled'+str(0.1)+all_vb[i].split("/")[-1])
        clean_audio, _ = librosa.load(all_vb[i], sr=16000)
        noise_count = np.random.randint(2, 6)
        noise_files = []
        
        #Sample noises from arca 
        while len(noise_files) < noise_count: 
            nxt_label = labels[int(np.random.randint(0, 69))]
            file_choice = random.choice(files_by_label[nxt_label])
            noise_files.append(librosa.load(file_choice, sr=16000)[0])
        min_length = min(len(arr) for arr in noise_files + [clean_audio])
        noise_files = [np.pad(arr[:min_length], (0, len(clean_audio) - min_length), 'constant') for arr in noise_files]
        net_arca_noise = np.sum(noise_files, axis=0)

        noise_weight = random.uniform(0.1, 0.3)
        final_audio = (1-noise_weight)*clean_audio + (noise_weight)*net_arca_noise
        output_name = os.path.join(output_dir, all_vb[i].split("/")[-1])
        sf.write(output_name, torch.tensor(final_audio), 16000)

if __name__ == "__main__":
    parser = ArgumentParser(description='create test samples with arca23k and gaussian noise in them')
    parser.add_argument('--voicebank_clean', default= '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/voicebank', type=str,
        help='directory with clean voicebank speech wav files')
    parser.add_argument('--arka23k_dir', default= '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/arca23k', type=str,
        help='arka23k directory')
    parser.add_argument('--start', default=0, type=int,
        help='maximum number of training steps')
    parser.add_argument('--end', default=1, type=int,
        help='maximum number of training steps')
    main(parser.parse_args())