variable "environment" {
  description = "The environment name"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS nodes will be deployed (should be private)"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.30"
}

variable "eks_cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster"
  type        = string
}

variable "eks_node_role_arn" {
  description = "IAM Role ARN for the EKS nodes"
  type        = string
}

variable "use_spot_instances" {
  description = "If true, EKS managed node groups will use Spot Instances to optimize costs"
  type        = bool
  default     = false
}

variable "min_size" {
  description = "Minimum number of nodes in the managed node group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes in the managed node group"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired number of nodes in the managed node group"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "List of instance types for the managed node group (can use Graviton)"
  type        = list(string)
  default     = ["t3.medium"]
}
