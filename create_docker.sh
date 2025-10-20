#!/bin/bash

IMAGE_NAME="glm-tutorial-img"
CONTAINER_NAME="glm-tutorial"
GIT_USER_NAME=""
GIT_USER_EMAIL=""

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --git_user_name)
      GIT_USER_NAME="$2"
      shift 2
      ;;
    --git_user_email)
      GIT_USER_EMAIL="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 --git_user_name <name> --git_user_email <email>"
      exit 1
      ;;
  esac
done

# Check if the Docker image exists
if docker image inspect $IMAGE_NAME >/dev/null 2>&1; then
  echo "Docker image '$IMAGE_NAME' already exists. Skipping build."
else
  echo "Docker image '$IMAGE_NAME' not found. Building..."
  
  # Check if required arguments are provided
  if [ -z "$GIT_USER_NAME" ] || [ -z "$GIT_USER_EMAIL" ]; then
    echo "Error: Both --git_user_name and --git_user_email are required for building the image"
    echo "Usage: $0 --git_user_name <name> --git_user_email <email>"
    exit 1
  fi
  
  docker build \
    --build-arg GIT_USER_NAME="$GIT_USER_NAME" \
    --build-arg GIT_USER_EMAIL="$GIT_USER_EMAIL" \
    -t $IMAGE_NAME .
fi

docker run -p 8888:8888 -v ./:/home --rm --name $CONTAINER_NAME \
    --memory="16g" \
    --shm-size="4g" \
    $IMAGE_NAME \
    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root