import os
import os.path as P
from glob import glob
import argparse
import random

if __name__ == '__main__':
    paser = argparse.ArgumentParser()
    paser.add_argument("-i", "--input_dir", default="dataset/VEGAS/dog/videos")
    paser.add_argument("-o", "--output_dir", default="filelists")
    paser.add_argument("-p", "--prefix", default="ours")
    args = paser.parse_args()
    input_dir = args.input_dir
    output_dir = args.output_dir
    os.makedirs(output_dir, exist_ok=True)

    random.seed(127)
    video_paths = glob(P.join(input_dir, "*.mp4"))
    
    random.shuffle(video_paths)
    val_ratio = 0.2;
    num_val = int(round(val_ratio*len(video_paths)))
    val_set = video_paths[:num_val]
    train_set = video_paths[num_val:]   
    

    with open(P.join(output_dir, args.prefix+"_train.txt"), 'w') as f:
        for video_path in train_set:
            f.write(f"{os.path.basename(video_path).split('.')[0]}\n")
    f.close()

    with open(P.join(output_dir, args.prefix+"_test.txt"), 'w') as f:
        for video_path in val_set:
            f.write(f"{os.path.basename(video_path).split('.')[0]}\n")
    f.close()
