module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids

  cluster_endpoint_public_access = true

  # IAM Roles (we can pass our custom roles or let the module manage it)
  # For this module, using the managed role creation is often safer, 
  # but since we have strict IAM requirements, we use the ones we passed.
  create_iam_role = false
  iam_role_arn    = var.eks_cluster_role_arn

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
      capacity_type  = var.use_spot_instances ? "SPOT" : "ON_DEMAND"

      create_iam_role = false
      iam_role_arn    = var.eks_node_role_arn

      # Block device mappings for security
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 50
            volume_type           = "gp3"
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
    }
  }

  tags = {
    Environment = var.environment
  }
}
