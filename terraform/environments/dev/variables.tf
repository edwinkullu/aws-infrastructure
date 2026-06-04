variable "environment" { type = string }

# VPC Variables
variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "database_subnets" { type = list(string) }
variable "enable_nat_gateway" { type = bool }
variable "single_nat_gateway" { type = bool }

# EKS Variables
variable "eks_cluster_name" { type = string }
variable "eks_use_spot_instances" { type = bool }
variable "eks_min_size" { type = number }
variable "eks_desired_size" { type = number }
variable "eks_max_size" { type = number }
variable "eks_instance_types" { type = list(string) }

# RDS Variables
variable "rds_multi_az" { type = bool }
variable "rds_instance_class" { type = string }
variable "rds_allocated_storage" { 
  type = number
  default = 20
}
variable "db_name" { type = string }
variable "db_username" { type = string }
variable "db_password" { 
  type = string
  sensitive = true 
}

# S3 Variables
variable "s3_bucket_name" { type = string }
variable "s3_enable_versioning" { type = bool }
variable "s3_transition_to_ia_days" { type = number }
variable "s3_expiration_days" { type = number }

# ECR Variables
variable "ecr_repository_name" { type = string }
variable "ecr_image_tag_mutability" { type = string }
