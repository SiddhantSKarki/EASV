data=../siddhant/data
soundtype=ours

#Extract RGB feature
python extract_feature.py \
-t $data/filelists/${soundtype}_train.txt \
-m RGB \
-i $data/features/${soundtype}/OF_10s_21.5fps \
-o $data/features/${soundtype}/feature_rgb_bninception_dim1024_21.5fps

python extract_feature.py \
-t $data/filelists/${soundtype}_test.txt \
-m RGB \
-i $data/features/${soundtype}/OF_10s_21.5fps \
-o $data/features/${soundtype}/feature_rgb_bninception_dim1024_21.5fps

#Extract optical flow feature
python extract_feature.py \
-t $data/filelists/${soundtype}_train.txt \
-m Flow \
-i $data/features/${soundtype}/OF_10s_21.5fps \
-o $data/features/${soundtype}/feature_flow_bninception_dim1024_21.5fps

python extract_feature.py \
-t $data/filelists/${soundtype}_test.txt \
-m Flow \
-i $data/features/${soundtype}/OF_10s_21.5fps \
-o $data/features/${soundtype}/feature_flow_bninception_dim1024_21.5fps