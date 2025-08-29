
variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}


variable "private_subnet_ids" {
  description = "List of private subnet IDs where EKS cluster resources can be placed"
  type        = list(string)
  default     = []
}

variable "node_role_arn" {
  description = "node role arn"
  type = string
  default = null
}

variable "desired_size" {
  type        = number
  default = null
}
variable "min_size" {
  type        = number
  default = null
}
variable "max_size" {
  type        = number
  default = null
}


variable "instance_types" {
  type = list(string)
  default = null
}
