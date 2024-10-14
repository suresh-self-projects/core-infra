#!/bin/bash
echo "script_started" > /tmp/script_started.txt
# Install MicroK8s
sudo hostnamectl set-hostname clusternode
sudo apt update
sudo apt install -y snapd
sudo snap install microk8s --classic

# Add user to microk8s group to avoid sudo requirement
sudo usermod -aG microk8s ubuntu
sudo chown -R ubuntu ~/.kube

# Allow aliasing microk8s kubectl
# sudo microk8s status --wait-ready
# sudo microk8s enable dns storage
# sudo ufw allow in on cni0
# sudo ufw allow out on cni0
# sudo ufw default allow routed

sudo reboot now
