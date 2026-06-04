environment = "dev"

# VPC
vpc_cidr           = "10.0.0.0/16"
azs                = ["us-east-1a", "us-east-1b"]
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.11.0/24", "10.0.12.0/24"]
database_subnets   = ["10.0.21.0/24", "10.0.22.0/24"]
enable_nat_gateway = true
single_nat_gateway = true

# EKS
eks_cluster_name       = "my-custom"
eks_use_spot_instances = true
eks_min_size           = 1
eks_desired_size       = 1
eks_max_size           = 2
eks_instance_types     = ["t3.medium", "t3.large"]

# RDS
rds_multi_az          = false
rds_instance_class    = "db.t4g.micro"
rds_allocated_storage = 20
db_name               = "devdb"
db_username           = "devadmin"
db_password           = "SecurePassword123!" # Ideally injected via CI/CD

# S3
s3_bucket_name           = "dev-app-data-bucket-us-east-1"
s3_enable_versioning     = false
s3_transition_to_ia_days = 14
s3_expiration_days       = 30

# ECR
ecr_repository_name      = "app-repo"
ecr_image_tag_mutability = "MUTABLE"
