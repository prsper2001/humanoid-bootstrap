#!/bin/bash

mkdir -p /workspace/persistent/backups

cp -r \
/root/Humanoid-Manipulation/outputs \
/workspace/persistent/backups/outputs_$(date +%Y%m%d_%H%M%S)
