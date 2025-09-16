# InnovateMart Developer Access Guide

## AWS Console Access
- URL: https://864942469439.signin.aws.amazon.com/console
- Username: innovatemart-developer
- Password: [set during first login, requires reset]

## Programmatic Access
- Access Key ID: [from create-access-key output]
- Secret Access Key: [from create-access-key output]
- Region: eu-west-1

## Kubernetes Access
1. Install AWS CLI and kubectl
2. Configure AWS credentials:
   ```bash
   aws configure
   # Use the access keys above
Configure kubeconfig:

bash
aws eks update-kubeconfig --name innovatemart-eks --region eu-west-1
Permissions
Read-only access to EKS cluster

Can view pods, services, deployments, logs

Cannot make any changes to resources

Example Commands
bash
# View pods
kubectl get pods -n retail

# View services
kubectl get svc -n retail

# View logs
kubectl logs -n retail <pod-name>

# Describe resources
kubectl describe deployment -n retail <deployment-name>
