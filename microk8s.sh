#!/bin/bash
sudo snap install microk8s --classic
sudo usermod -aG microk8s ubuntu
sudo mkdir -p /home/ubuntu/.kube
sudo chown -Rf ubuntu /home/ubuntu/.kube
sudo microk8s enable dns ingress
sudo microk8s kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
sudo microk8s kubectl patch storageclass local-path -p '{\"metadata\": {\"annotations\":{\"storageclass.kubernetes.io/is-default-class\":\"true\"}}}'
sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.helm helm