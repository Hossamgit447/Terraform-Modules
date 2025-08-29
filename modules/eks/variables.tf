
variable "cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster (must have eks.amazonaws.com trust relationship)"
  type        = string
  default = null
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where EKS cluster resources can be placed"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where EKS cluster resources can be placed"
  type        = list(string)
  default     = []
}
variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "cluster_name" {
  type        = string
  default = null
}
variable "subnet_ids" {
  type        = list(string)
  default = null
}
