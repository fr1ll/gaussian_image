#!/bin/bash

data_path=$1

if [ -z "$data_path" ]; then
    echo "Error: No data_path provided."
    echo "Usage: $0 <data_path>"
    exit 1
fi

for num_points in 3000 7000 11000
do
CUDA_VISIBLE_DEVICES=0 python -m gaussian_image.train -d $data_path \
--data_name custom_dataset --model_name GaussianImage_Cholesky \
--num_points $num_points --iterations 50000 \
--save_imgs --save_every_n_image 1000
done
