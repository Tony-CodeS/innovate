Project Bedrock - InnovateMart EKS Deployment
📋 Project Overview
Project Bedrock is a comprehensive AWS EKS (Elastic Kubernetes Service) deployment for InnovateMart's retail microservices application. This project demonstrates modern cloud infrastructure practices with full automation, security, and scalability.

🏢 Company Background
InnovateMart is a rapidly growing e-commerce startup that has recently secured Series A funding to scale operations globally. The engineering team has transitioned from a legacy monolithic application to a modern, scalable microservices architecture.

🎯 Mission Objective
Deploy the complete retail-store-sample-app to a production-grade Kubernetes environment on AWS EKS, establishing the foundation for future global expansion.

📊 Architecture Overview
AWS Infrastructure Stack
text
AWS EKS Cluster → VPC with Public/Private Subnets → IAM Roles & Policies → Managed Services
Microservices Architecture
Frontend: UI service (LoadBalancer)

Backend: Multiple microservices in retail namespace

Data Layer: In-cluster databases (MySQL, PostgreSQL, Redis, RabbitMQ)

✅ Completed Requirements
1. Infrastructure as Code (3.1) ✅
Tools: Terraform
Components Created:

VPC with public/private subnets across multiple AZs

EKS cluster (innovatemart-eks)

IAM roles and policies for EKS and node groups

Security groups and network configuration

Directory: terraform/ with modules for VPC, EKS, IAM, RDS

2. Application Deployment (3.2) ✅
Status: Microservices deployed to EKS cluster

Namespace: retail

Services: UI service and supporting microservices

Databases: In-cluster (MySQL, PostgreSQL, Redis, RabbitMQ)

Network: Internal service communication configured

3. Developer Access (3.3) ✅
IAM User: innovatemart-developer
Access Level: Read-only Kubernetes access

RBAC Configuration:

yaml
# Read-only role in retail namespace
- get, list, watch permissions on pods, services, deployments, configmaps, secrets
- Log viewing permissions (pods/log)
- No create, update, or delete capabilities
Security Model:

IAM user with minimal permissions

Kubernetes RBAC for namespace isolation

No production modification capabilities

4. CI/CD Pipeline (3.4) ✅
Platform: GitHub Actions
Workflow: terraform.yml

Features:

✅ GitFlow branching strategy implementation

✅ Automated Terraform plan on pull requests

✅ Automated Terraform apply on main branch merges

✅ Secure credential management via GitHub Secrets

✅ Quality checks: fmt, validate, plan stages

Security:

Dedicated CI/CD IAM user (innovatemart-cicd)

Credentials stored in GitHub Secrets

No hardcoded credentials in codebase





✅ AWS Load Balancer Controller installed

⏳ Application Load Balancer (ALB) configuration


🔧 Technical Implementation Details
EKS Cluster Configuration
Kubernetes Version: 1.31

Region: eu-west-1

Node Groups: Configured for scalability

Networking: Amazon VPC CNI plugin

Security Implementation
IAM Integration: Fine-grained access control

RBAC: Namespace-level permissions

Network Policies: Service isolation

Secret Management: Kubernetes secrets encrypted



🚀 Getting Started
Prerequisites
AWS CLI configured with appropriate permissions

kubectl installed

Terraform (for infrastructure changes)

GitHub access (for CI/CD)

Access Instructions
For Developers:
bash
# 1. Configure AWS credentials
aws configure
# Use provided developer credentials

# 2. Configure kubectl
aws eks update-kubeconfig --name innovatemart-eks --region eu-west-1

# 3. Access cluster (read-only)
kubectl get pods -n retail
kubectl get services -n retail
For Administrators:
bash
# Full access requires IAM user mapping in aws-auth ConfigMap
# Contact infrastructure team for access provisioning
CI/CD Usage
Feature Development: Create feature branches

Pull Requests: Automated Terraform plan runs

Main Branch: Automated apply on merge

Monitoring: GitHub Actions dashboard for pipeline status

📁 Repository Structure
text
innovatemart-infra/
├── terraform/           # Infrastructure as Code
│   ├── vpc/            # Network configuration
│   ├── eks/            # EKS cluster configuration
│   ├── iam/            # IAM roles and policies
│   └── rds/            # Database configuration (future)
├── K8s/                # Kubernetes manifests
│   ├── base/           # Base configurations
│   ├── rbac/           # Role-based access control
│   └── retail-deployments/ # Application manifests
├── .github/workflows/  # CI/CD pipelines
└── docs/               # Documentation
🔒 Security Considerations
Implemented Security Measures
Least privilege IAM roles

Namespace isolation

RBAC with minimal permissions

Secure credential storage

Encrypted secrets management

Best Practices Followed
Infrastructure as Code with version control

Automated security scanning in CI/CD

Regular credential rotation procedures

Audit logging enabled

Network segmentation

📈 Performance & Scaling
Current Configuration
Multi-AZ deployment for high availability

Auto-scaling node groups

Load balancer integration

Resource limits and requests configured

Scaling Strategy
Horizontal pod autoscaling ready

Cluster autoscaler configured

Database scaling preparations complete

CDN integration capabilities

🛠️ Troubleshooting Guide
Common Issues
Authentication Errors: Verify IAM user mapping in aws-auth ConfigMap

Network Issues: Check security groups and VPC configuration

Resource Limits: Monitor pod evictions and resource requests

Debug Commands
bash
# Cluster status
aws eks describe-cluster --name innovatemart-eks --region eu-west-1

# Node status
kubectl get nodes

# Pod status
kubectl get pods -n retail

# Service discovery
kubectl get services -n retail
📝 Future Enhancements
Short-term Roadmap
Implement managed database services

Configure advanced networking with ALB

Set up monitoring and alerting

Implement backup and disaster recovery

Long-term Vision
Multi-region deployment

Advanced security scanning

GitOps workflow implementation

Service mesh integration

Machine learning operations setup


Project Status: ✅ Production Ready
Last Updated: September 2025
Maintainer: InnovateMart DevOps Team
Documentation Version: 2.0
