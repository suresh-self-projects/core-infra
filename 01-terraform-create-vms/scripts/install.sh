#!/bin/bash
sudo hostnamectl set-hostname clusternode
sudo snap install microk8s --classic --channel=1.31
sudo usermod -a -G microk8s $USER
mkdir -p ~/.kube
chmod 0700 ~/.kube
alias microctl='microk8s kubectl'
sudo reboot now
# microk8s status --wait-ready
# microk8s kubectl get nodes
# microk8s kubectl get services
# alias microctl='microk8s kubectl'
# microk8s kubectl create deployment nginx --image=nginx
# microk8s kubectl get pods
# microk8s enable dns
# microk8s enable hostpath-storage
# microk8s stop
# microk8s start