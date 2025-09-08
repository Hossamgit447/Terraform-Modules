variable "env"       { type = string }
variable "vpc_id"    { type = string }
variable "public_subnet_id" { type = string } # NAT must live in a public subnet
variable "private_subnet_ids" {
  type = list(string)
}