#!/bin/bash

folder_name=train

save_dir=../../data/sat-$folder_name

if [ ! -e $save_dir ]; then
  mkdir -p $save_dir
fi

python sat_gen.py \
  -save_dir $save_dir \
  -folder_name $folder_name