#!/bin/bash
set -e

echo "===== START SETUP ====="

# -----------------------------
# 1. apt packages
# -----------------------------
apt-get update

apt-get install -y \
    git \
    wget \
    unzip \
    xvfb \
    python3-pip

# -----------------------------
# 2. virtual display
# -----------------------------
export DISPLAY=:1

if ! pgrep Xvfb > /dev/null; then
    Xvfb :1 -screen 0 1280x720x24 &
    sleep 2
fi

# -----------------------------
# 3. clone humanoid repo
# -----------------------------
cd /root

if [ ! -d "Humanoid-Manipulation" ]; then
    git clone https://github.com/YOUR_REPO/Humanoid-Manipulation.git
fi

cd Humanoid-Manipulation

# -----------------------------
# 4. python packages
# -----------------------------
pip install --upgrade pip

pip install \
    numpy \
    torch \
    torchvision \
    matplotlib \
    trimesh \
    h5py \
    gymnasium

echo "===== SETUP COMPLETE ====="

