#!/bin/bash

g_type=lobster
ordering=DFS

save_dir=../../data/$g_type-$ordering

if [ ! -e $save_dir ]; then
  mkdir -p $save_dir
fi

python synthetic_data_gen.py \
  -save_dir $save_dir \
  -g_type $g_type \
  -node_order $ordering \