output "eks_cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  value       = var.create_eks_roles ? aws_iam_role.eks_cluster[0].arn : null
}

output "eks_node_role_arn" {
  description = "The ARN of the IAM role for EKS nodes"
  value       = var.create_eks_roles ? aws_iam_role.eks_node[0].arn : null
}
