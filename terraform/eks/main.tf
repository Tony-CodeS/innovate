module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.27"
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnets

  # Use the IAM role you already created for the EKS cluster
  iam_role_arn = var.cluster_role_arn

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]

      # Node role you created earlier
      iam_role_arn = var.node_role_arn
    }
  }

  tags = {
    Project = var.project_name
  }
}
