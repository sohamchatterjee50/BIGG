#!/bin/bash

g_type=lobster
ordering=DFS
blksize=-1
bsize=128

data_dir=../../../../data/$g_type-$ordering

save_dir=../../../../results/$g_type/$ordering-blksize-$blksize-b-$bsize

if [ ! -e $save_dir ];
then
  mkdir -p $save_dir
fi

export CUDA_VISIBLE_DEVICES=0

python ../batch_train.py \
  -data_dir $data_dir \
  -save_dir $save_dir \
  -g_type $g_type \
  -node_order $ordering \
  -num_graphs $num_g \
  -blksize $blksize \
  -epoch_save 500 \
  -bits_compress 256 \
  -batch_size $bsize \
  -num_test_gen 100 \
  -num_epochs 1000 \
  -gpu 0 \
  $@