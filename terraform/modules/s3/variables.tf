variable "environment" {
  description = "The environment name"
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket (must be globally unique)"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = true
}

variable "transition_to_ia_days" {
  description = "Number of days before transitioning to Standard-IA (cost savings)"
  type        = number
  default     = 30
}

variable "expiration_days" {
  description = "Number of days before objects are permanently deleted. 0 disables expiration."
  type        = number
  default     = 0
}
