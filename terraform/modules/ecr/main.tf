resource "aws_ecr_repository" "this" {
  name                 = "${var.environment}-${var.repository_name}"
  image_tag_mutability = var.image_tag_mutability

  # Security: Automatically scan pushed images for vulnerabilities
  image_scanning_configuration {
    scan_on_push = true
  }

  # Security: Encrypt the images at rest
  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Environment = var.environment
  }
}

# FinOps/Cost Optimization: Automatically delete untagged images older than 14 days
resource "aws_ecr_lifecycle_policy" "cleanup" {
  repository = aws_ecr_repository.this.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire untagged images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Keep last 30 tagged images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
