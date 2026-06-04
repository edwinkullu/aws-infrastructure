module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.environment}-vpc"
  cidr = var.vpc_cidr

  azs              = var.azs
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true

  # NAT Gateway Configuration (Cost Optimization Toggle)
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.enable_nat_gateway && !var.single_nat_gateway

  enable_vpn_gateway = var.enable_vpn_gateway

  # VPC Endpoints for S3 and DynamoDB to save on NAT data transfer costs
  enable_dns_hostnames = true
  enable_dns_support   = true

  vpc_tags = {
    Name = "${var.environment}-vpc"
  }
}

# Gateway Endpoints (Free of charge, saves NAT data transfer)
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = flatten([module.vpc.private_route_table_ids, module.vpc.public_route_table_ids])
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = flatten([module.vpc.private_route_table_ids, module.vpc.public_route_table_ids])
}

data "aws_region" "current" {}
