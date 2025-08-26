variable "name" {
  description = "Name of the secret"
  type        = string
  default = "myapp-db-password"
}

variable "description" {
  description = "Description of the secret"
  type        = string
  default     = null
}


