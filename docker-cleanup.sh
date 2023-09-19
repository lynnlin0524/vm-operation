#!/bin/bash

# Stop all running containers
docker stop $(docker ps -aq)

# Remove all stopped containers
docker rm $(docker ps -aq)

# Remove unused images
docker image prune -a --force

# Remove unused volumes
docker volume prune --force

# Remove unused networks
docker network prune --force

# Restart Docker service
sudo systemctl restart docker
