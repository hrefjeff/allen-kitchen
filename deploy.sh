#!/bin/bash

set -e

# Configuration
REPOSITORY_NAME="allen-kitchen"
AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="${AWS_ACCOUNT_ID:-123}"

# Check if AWS_ACCOUNT_ID is set
if [ "$AWS_ACCOUNT_ID" = "123" ]; then
    echo "Error: Please set AWS_ACCOUNT_ID environment variable or edit this script"
    echo "Example: export AWS_ACCOUNT_ID=123456789012"
    exit 1
fi

ECR_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPOSITORY_NAME}"

echo "=== Logging into ECR ==="
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_URI}

echo "=== Building Docker image ==="
# Detect platform
if [[ $(uname -m) == "arm64" ]]; then
    echo "Detected ARM architecture (Mac M1/M2), building for linux/amd64..."
    docker build --platform linux/amd64 -t ${REPOSITORY_NAME} .
else
    echo "Detected AMD64 architecture, building natively..."
    docker build -t ${REPOSITORY_NAME} .
fi

echo "=== Tagging image ==="
docker tag ${REPOSITORY_NAME}:latest ${ECR_URI}:latest

echo "=== Pushing to ECR ==="
docker push ${ECR_URI}:latest

echo "=== Deployment complete! ==="
echo "Image pushed to: ${ECR_URI}:latest"
