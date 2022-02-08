# jenkins-minikube
Creates a jenkins server on a kubernetes minikube node. Requires Helm.

The ```jenkins-volume.yaml``` file allows for the creation of a persistant volume.

```jenkins-sa.yaml``` creates a standard default cluster role for simple access to the cluster.


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
