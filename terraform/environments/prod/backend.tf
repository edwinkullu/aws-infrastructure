terraform {
  backend "s3" {
    bucket         = "prod-tf-state-REPLACE_WITH_ID" # Will be replaced after prod backend setup
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod-terraform-locks"
    encrypt        = true
    profile        = "production-admin"
  }
}
