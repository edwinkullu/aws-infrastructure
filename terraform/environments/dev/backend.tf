terraform {
  backend "s3" {
    bucket         = "non-prod-tf-state-REPLACE_WITH_ID" # Will be replaced after backend setup
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "non-prod-terraform-locks"
    encrypt        = true
  }
}
