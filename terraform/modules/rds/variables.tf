variable "environment" {
  description = "The environment name"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "database_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "multi_az" {
  description = "If true, deploy RDS in Multi-AZ mode for high availability"
  type        = bool
  default     = false
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Password for the master DB user. In production, use AWS Secrets Manager instead!"
  type        = string
  sensitive   = true
}
