terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "production-admin" # Strict isolation using a separate profile

  default_tags {
    tags = {
      Environment = "prod"
      Project     = "Infrastructure"
      ManagedBy   = "Terraform"
      # No Schedule tag, prod runs 24/7
    }
  }
}
