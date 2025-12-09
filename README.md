# Allen Kitchen

# Deployment Commands

```sh
aws ecr create-repository --repository-name allen-kitchen
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/allen-kitchen

# If using a pc's amd64 chip
docker build -t allen-kitchen .
# If using a mac's arm chip
docker build --platform linux/amd64 -t allen-kitchen .

docker tag allen-kitchen:latest <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/allen-kitchen:latest
docker push <your-account-id>.dkr.ecr.us-east-1.amazonaws.com/allen-kitchen:latest
```
