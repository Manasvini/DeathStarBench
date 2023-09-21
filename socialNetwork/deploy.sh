#!/bin/bash
sudo k3s kubectl delete namespace socialnetwork
sudo k3s kubectl create namespace socialnetwork
cd helm-chart
sudo helm install socialnetwork socialnetwork/ -n socialnetwork --kubeconfig /etc/rancher/k3s/k3s.yaml  --set-string global.resources="requests: 
      memory: "64Mi"
      cpu: "2"
    limits:
      memory: "128Mi"
      cpu: "2""

