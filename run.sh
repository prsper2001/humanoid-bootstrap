#!/bin/bash

export DISPLAY=:1

cd /root/Humanoid-Manipulation

/isaac-sim/python.sh scripts/train.py \
    task=reorient \
    num_envs=16 \
    seed=42 \
    checkpoint=/workspace/persistent/checkpoints/latest.pt
