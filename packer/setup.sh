#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Update package lists
sudo apt update
echo "[INFO] Updating package lists... "
sudo apt-get update
echo "[INFO] Updating package lists complete."

# Optional: Install software-properties-common if not already present
sudo apt-get install -y software-properties-common

# Upgrade system packages
echo "[INFO] Upgrading system... "
sudo apt-get dist-upgrade -y
echo "[INFO] Upgrading system complete."

# Install nginx
echo "[INFO] Installing nginx..."
sudo apt-get install -y nginx
echo "[INFO] Nginx installed."

# Verify nginx installation
nginx -v