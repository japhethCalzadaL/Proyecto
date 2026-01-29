#!/bin/bash
set -e

IMAGE_NAME="fastapi-app-test"
CONTAINER_NAME="fastapi-test-container"
PORT=8000

echo "Build the Docker image..."
docker build -t $IMAGE_NAME .

echo "Run the container..."
# Stop and remove if exists
docker rm -f $CONTAINER_NAME 2>/dev/null || true
docker run -d --name $CONTAINER_NAME -p $PORT:8000 $IMAGE_NAME

echo "Waiting for the service to be ready..."
RETRIES=10
SLEEP=2
READY=false

for i in $(seq 1 $RETRIES); do
    if curl -s "http://localhost:$PORT/" | grep -q "Hello World"; then
        READY=true
        break
    fi
    echo "Waiting... ($i/$RETRIES)"
    sleep $SLEEP
done

if [ "$READY" = true ]; then
    echo "Test PASSED: Service returned expected response."
else
    echo "Test FAILED: Service did not respond correctly."
    docker logs $CONTAINER_NAME
    exit 1
fi

echo "Cleaning up..."
docker rm -f $CONTAINER_NAME
docker rmi $IMAGE_NAME
