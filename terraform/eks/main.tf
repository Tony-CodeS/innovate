module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  # Tell the module not to create new IAM roles
  create_iam_role = false

  # Use the IAM role you created for the cluster
  iam_role_arn = var.cluster_role_arn

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]

      # Also tell node group not to create a new role
      create_iam_role = false
      iam_role_arn    = var.node_role_arn
    }
  }

  tags = {
    Project = var.project_name
  }
}
