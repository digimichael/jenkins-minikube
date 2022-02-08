#!/bin/bash

helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm search repo jenkinsci


kubectl create namespace jenkins
kubectl apply -f ./jenkins-volume.yaml
kubectl apply -f ./jenkins-sa.yaml 

chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f jenkins-values.yaml $chart

jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
echo "This is the password: " $(echo $secret | base64 --decode)

jsonpath="{.spec.ports[0].nodePort}"
NODE_PORT=$(kubectl get -n jenkins -o jsonpath=$jsonpath services jenkins)
jsonpath="{.items[0].status.addresses[0].address}"
NODE_IP=$(kubectl get nodes -n jenkins -o jsonpath=$jsonpath)
echo "This is the URL: " http://$NODE_IP:$NODE_PORT/login