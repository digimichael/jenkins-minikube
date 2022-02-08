# jenkins-minikube
Creates a jenkins server on a kubernetes minikube node. Requires Helm

# How to Use
Start a minikube with the command

```
minicube start
```

Then the script ```password-url.sh``` needs to run.

Once the script runs, you can check the progress of the pods with:
```
kubectl get pods -n jenkins
```
