variable "environment" {
  description = "The environment name"
  type        = string
}

variable "create_eks_roles" {
  description = "Create foundational EKS roles if not using the EKS module defaults"
  type        = bool
  default     = true
}
