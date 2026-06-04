terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  # Default tags apply to all resources created in this environment, saving time and ensuring FinOps compliance
  default_tags {
    tags = {
      Environment = "dev"
      Project     = "Infrastructure"
      ManagedBy   = "Terraform"
      Schedule    = "business-hours" # Used by AWS Instance Scheduler to stop non-prod at night
    }
  }
}
