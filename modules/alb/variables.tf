variable "cluster_name" {
  type = string
}
variable "env" {
  type = string
}
variable "oidc_provider_arn" {
  description = "The OIDC provider ARN for the EKS cluster"
  type        = string
}