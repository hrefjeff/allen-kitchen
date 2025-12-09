# Allen Kitchen

# Deployment Commands

```sh
aws ecr create-repository --repository-name allen-kitchen
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account id>.dkr.ecr.us-east-1.amazonaws.com/allen-kitchen
```
