#!/bin/bash

cd /root

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

tar \
  --exclude='humanoid-rl/venv' \
  --exclude='humanoid-rl/logs' \
  --exclude='humanoid-rl/__pycache__' \
  -czf humanoid-rl_backup_${TIMESTAMP}.tar.gz \
  humanoid-rl/

mkdir -p humanoid-bootstrap/backup

mv humanoid-rl_backup_${TIMESTAMP}.tar.gz humanoid-bootstrap/backup/
