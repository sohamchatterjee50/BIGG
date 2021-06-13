#!/bin/bash

g_type=train
blksize=500
bsize=1

data_dir=../../../data/sat-$g_type
save_dir=../../..//results/sat-$g_type/blk-$blksize-b-$bsize

if [ ! -e $save_dir ];
then
  mkdir -p $save_dir
fi

export CUDA_VISIBLE_DEVICES=0

python main.py \
  -data_dir $data_dir \
  -save_dir $save_dir \
  -g_type $g_type \
  -blksize $blksize \
  -epoch_save 500 \
  -bits_compress 256 \
  -accum_grad 10 \
  -batch_size $bsize \
  -gpu 0 \
  $@