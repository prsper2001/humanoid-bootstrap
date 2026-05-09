#!/bin/bash
set -e

cd /root/Humanoid-Manipulation

echo "================================="
echo "Using Isaac Sim Python"
echo "================================="

/isaac-sim/python.sh --version

echo "================================="
echo "Starting training"
echo "================================="

/isaac-sim/python.sh scripts/train.py \
    task=reorient \
    num_envs=16 \
    seed=42