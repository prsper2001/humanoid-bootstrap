#!/bin/bash
set -e

echo "===== START SETUP ====="

# =========================================================
# 1. apt packages
# =========================================================
apt-get update

apt-get install -y \
    git \
    wget \
    unzip \
    xvfb \
    python3-pip

# =========================================================
# 2. clone Humanoid-Manipulation
# =========================================================
cd /root

if [ ! -d "humanoid-rl" ]; then
    git clone https://github.com/jinhac174/humanoid-rl.git
fi

# =========================================================
# 3. clone IsaacLab
# =========================================================
cd /root

if [ ! -d "IsaacLab" ]; then
    git clone https://github.com/isaac-sim/IsaacLab.git
fi

# =========================================================
# 4. install Python packages INTO Isaac Sim Python
# =========================================================
echo "===== INSTALLING PYTHON PACKAGES ====="

/isaac-sim/python.sh -m pip install --upgrade pip

/isaac-sim/python.sh -m pip install \
    numpy \
    torch \
    torchvision \
    matplotlib \
    trimesh \
    h5py \
    gymnasium \
    wandb \
    hydra-core \
    tensorboard \
    moviepy \
    imageio

# =========================================================
# 5. install IsaacLab
# =========================================================
cd /root/IsaacLab

echo "===== INSTALLING ISAACLAB ====="

./isaaclab.sh --install

# editable installs
/isaac-sim/python.sh -m pip install -e source/isaaclab
/isaac-sim/python.sh -m pip install -e source/isaaclab_tasks

# =========================================================
# 6. install humanoid repo requirements
# =========================================================
cd /root/humanoid-rl

if [ -f requirements.txt ]; then
    /isaac-sim/python.sh -m pip install -r requirements.txt
fi

echo "===== VERIFYING INSTALL ====="

/isaac-sim/python.sh -c "import isaacsim; print('IsaacSim OK')"
/isaac-sim/python.sh -c "import isaaclab; print('IsaacLab OK')"
/isaac-sim/python.sh -c "import wandb; print('wandb OK')"

echo "===== SETUP COMPLETE ====="
