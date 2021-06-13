#!/bin/bash

g_type=grid
ordering=BFS

blksize=100

data_dir=../../../data/$g_type-$ordering

save_dir=../../../scratch/$g_type-$ordering-$blksize

if [ ! -e $save_dir ];
then
  mkdir -p $save_dir
fi

# number of gpus to use
num_proc=4

export OMP_NUM_THREADS=2

python -m torch.distributed.launch --nproc_per_node=$num_proc dist_main.py \
    -data_dir $data_dir \
    -save_dir $save_dir \
    -num_proc $num_proc \
    -g_type $g_type \
    -blksize $blksize \
    -epoch_save 100 \
    -bits_compress 256 \
    -gpu 0 \
    $@
