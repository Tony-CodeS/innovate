module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.27"
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnets

  # Attach the pre-created cluster role
  cluster_iam_role_name = basename(var.cluster_role_arn)

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]

      # Attach the pre-created node role
      iam_role_arn = var.node_role_arn
    }
  }

  tags = {
    Project = var.project_name
  }
}
