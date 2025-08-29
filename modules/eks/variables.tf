variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for the EKS cluster (must have eks.amazonaws.com trust relationship)"
  type        = string
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

variable "node_role_arn" {
  description = "node role arn"
  type = string
  default = null
}

variable "cluster_name" {
  type        = string
}
variable "subnet_ids" {
  type        = list(string)
}
variable "desired_size" {
  type        = number
}
variable "min_size" {
  type        = number
}
variable "max_size" {
  type        = number
}
variable "instance_types" {
  type = list()
}