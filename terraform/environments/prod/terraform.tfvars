environment = "prod"

# VPC
vpc_cidr           = "10.1.0.0/16"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnets    = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
database_subnets   = ["10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]
enable_nat_gateway = true
single_nat_gateway = false

# EKS
eks_cluster_name       = "my-custom"
eks_use_spot_instances = false
eks_min_size           = 3
eks_desired_size       = 3
eks_max_size           = 10
eks_instance_types     = ["m6i.large", "m6a.large"]

# RDS
rds_multi_az          = true
rds_instance_class    = "db.r6g.large"
rds_allocated_storage = 100
db_name               = "proddb"
db_username           = "prodadmin"
db_password           = "ReplaceWithKMSEncryptedSecret!" # Must be managed outside source control

# S3
s3_bucket_name           = "prod-app-data-bucket-us-east-1-secure"
s3_enable_versioning     = true
s3_transition_to_ia_days = 90
s3_expiration_days       = 0

# ECR
ecr_repository_name      = "app-repo"
ecr_image_tag_mutability = "IMMUTABLE"
