data=../siddhant/data
soundtype=ours

# Data preprocessing. We will first pad all videos to 10s and change video FPS and audio
# sampling rate.
python extract_audio_and_video.py \
-i $data/videos/ours \
-o $data/features/${soundtype}

# Generating RGB frame and optical flow. This script uddses CPU to calculate optical flow,
# which may take a very long time. We strongly recommend you to refer to TSN repository 
# (https://github.com/yjxiong/temporal-segment-networks) to speed up this process.
python extract_rgb_flow.py \
-i $data/features/${soundtype}/videos_10s_21.5fps \
-o $data/features/${soundtype}/OF_10s_21.5fps


# #Split training/testing list
python my_gen_list.py \
-i $data/videos/${soundtype} \
-o $data/filelists --prefix ${soundtype}

#Extract Mel-spectrogram from audio
python extract_mel_spectrogram.py \
-i $data/features/${soundtype}/audio_10s_22050hz \
-o $data/features/${soundtype}/melspec_10s_22050hz