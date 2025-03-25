microk8s installation
=======================
https://microk8s.io/?_gl=1*vmd3qv*_gcl_au*NjU0MzkyODE3LjE3MjY0NTk5MzM.



Get worker nodes
microk8s kubectl get nodes
microk8s kubectl get nodes -o wide

Get cluster nodes
microk8s kubectl get services -o wide

Cluster info
microk8s kubectl cluster-info



sudo hostnamectl set-hostname clusternode
sudo reboot now


Label the nodes
===================
microk8s kubectl label node controlplane node-role.kubernetes.io/master=

microk8s kubectl label node worknode node-role.kubernetes.io/worker=


Export kube config
================
microk8s config > ~/.kube/config



Ansible
=========
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i inventory.ini install_microk8s.yml 
ansible-galaxy role init role_argocd

Ref
====
Install Microk8s via Ansible
        https://www.lakshminp.com/installing-microk8s-using-ansible/
        https://github.com/8grams/ansible-microk8s/tree/main


https://github.com/jaiswaladi246/ArgoCD-1/blob/main/argocd-setup.md




Virtual Machine
---------------------
username : vboxuser
password : welcome

ssh vboxuser@192.168.29.231
ssh vboxuser@192.168.29.104

  git config --global user.email "sureshr.tamizan@gmail.com"
  git config --global user.name "suresh-akidev"



ArgoCD
============
get all resource of argocd namespace
        kubectl get all -n argocd

get default password of argocd
        kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

argocd server to access argocd app
        Look for argocd-server where it should be NodePort or LoadBalancer -> http://192.168.29.231:32149
        username : admin
        password : Welcome@123