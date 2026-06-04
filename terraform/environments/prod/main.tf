module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr
  azs         = var.azs
  
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

module "eks" {
  source = "../../modules/eks"

  environment  = var.environment
  cluster_name = "${var.environment}-${var.eks_cluster_name}-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_node_role_arn    = module.iam.eks_node_role_arn

  use_spot_instances = var.eks_use_spot_instances
  min_size           = var.eks_min_size
  desired_size       = var.eks_desired_size
  max_size           = var.eks_max_size
  instance_types     = var.eks_instance_types
}

module "rds" {
  source = "../../modules/rds"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  database_subnet_group_name = module.vpc.database_subnet_group_name

  multi_az          = var.rds_multi_az
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage
  
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "s3" {
  source = "../../modules/s3"

  environment = var.environment
  bucket_name = var.s3_bucket_name
  
  enable_versioning     = var.s3_enable_versioning
  transition_to_ia_days = var.s3_transition_to_ia_days
  expiration_days       = var.s3_expiration_days
}

module "ecr" {
  source = "../../modules/ecr"

  environment          = var.environment
  repository_name      = var.ecr_repository_name
  image_tag_mutability = var.ecr_image_tag_mutability
}
