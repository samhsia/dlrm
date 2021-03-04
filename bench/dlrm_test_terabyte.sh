#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.
#
#WARNING: must have compiled PyTorch and caffe2

dlrm_pt_bin="python3 dlrm_s_pytorch.py"

##### Directories: #####
DATA_DIR="/data/terabyte"
##### Directories: #####

##### Parameters: #####
embedding_dim=8
mlp_bot="13-128-64-8"
mlp_top="128-64-1"

model_arch="--arch-sparse-feature-size=$embedding_dim --arch-mlp-bot=$mlp_bot --arch-mlp-top=$mlp_top"

data_type="dataset"
dataset="terabyte"
raw_data_file="$DATA_DIR/day"
processed_data_file="$DATA_DIR/terabyte.processed.npz"

sub_sample_rate=0.875
max_ind=10000000
data="--data-generation=$data_type --data-set=$dataset --raw-data-file=$raw_data_file --processed-data-file=$processed_data_file --data-sub-sample-rate=$sub_sample_rate --max-ind-range=$max_ind --memory-map"

loss=bce
rounding=True
lr=0.1
optimizer="--loss-function=$loss --round-targets=$rounding --learning-rate=$lr"

mini_bs=2048
test_mini_bs=16384
print_freq=1024
test_freq=10240
batching="--mini-batch-size=$mini_bs --test-mini-batch-size=$test_mini_bs --print-freq=$print_freq --test-freq=$test_freq"

args="$model_arch $data $optimizer $batching"
echo $args
##### Parameters: #####

echo "Running DLRM..."

$dlrm_pt_bin $args 2>&1

echo "Done!"
