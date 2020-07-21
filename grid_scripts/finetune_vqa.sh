#!/bin/bash
#$ -j yes
#$ -N finetune_vqa
#$ -o /home/eliasse/lxmert/grid_logs/finetune_vqa.out
#$ -l 'mem_free=50G,ram_free=50G,h_rt=24:00:00,gpu=1,hostname=b1[123456789]|c0*|c1[123456789]'
#$ -q g.q
#$ -m ae -M elias@jhu.edu
#$ -cwd

export LD_LIBRARY_PATH=:/opt/NVIDIA/cuda-10/lib64/
export CUDA_VISIBLE_DEVICES=$(free-gpu -n 1)
source activate lxmert

bash run/vqa_finetune.bash ${CUDA_VISIBLE_DEVICES} vqa_lxr955
