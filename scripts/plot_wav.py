import matplotlib.pyplot as plt 
import librosa
def save_plot(path, name): 
    plt.figure()
    audio, _ = librosa.load(path, sr = 16000)
    plt.plot(audio)
    plt.title(name)
    plt.savefig(name+'.png')
if __name__ == "__main__":
    file = '/p232_010.wav'
    clean_audio = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/voicebank/clean_testset_wav' + file
    noisy_input = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/voicebank/noisy_testset_wav' + file
    theirs = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/Enhanced/originalCDIFF/model370200/test/voicebank_Noisy_Test' + file
    ours = '/home/hice1/bgoyal7/scratch/MLLimitedSupervision/all_outputs/Enhanced/arcaAugmentedFinal/model450/test/voicebank_Noisy_Test' + file
    save_plot(clean_audio, 'clean ' + file[1:])
    save_plot(noisy_input, 'noisy input ' + file[1:])
    save_plot(ours, 'Our Model ' + file[1:])
    save_plot(theirs, 'Pretrained Base Output ' + file[1:])
    