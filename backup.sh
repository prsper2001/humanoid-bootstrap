#!/bin/bash

cd /root

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

tar \
  --exclude='Humanoid-Manipulation/venv' \
  --exclude='Humanoid-Manipulation/logs' \
  --exclude='Humanoid-Manipulation/__pycache__' \
  -czf humanoid_manipulation_backup_${TIMESTAMP}.tar.gz \
  Humanoid-Manipulation/

mkdir -p humanoid-bootstrap/backup

mv humanoid_manipulation_backup_${TIMESTAMP}.tar.gz humanoid-bootstrap/backup/