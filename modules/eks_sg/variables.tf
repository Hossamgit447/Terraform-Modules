
variable "env" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default = null
}
variable "vpc_id" {
  type = string
}