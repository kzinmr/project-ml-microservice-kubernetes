#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path

dockerpath=kzinmr/mlms

# Step 2
# Run the Docker Hub container with kubernetes
deployment_name=mlms-deployment
kubectl run --image=docker.io/${dockerpath} --port=80 $deployment_name
# kubectl create deployment $deployment_name --image=docker.io/${dockerpath}  # cannot set ports


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
service_name=mlms-service
kubectl expose deployment $deployment_name --type=NodePort --name=$service_name

# minikube service $service_name --url