#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
tag=mlms
username=kzinmr
dockerpath=${username}/${tag}

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
cat password.txt | docker login --username $username --password-stdin
docker tag $tag $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath