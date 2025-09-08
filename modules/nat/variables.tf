variable "env"       { type = string }
variable "vpc_id"    { type = string }
variable "public_subnet_ids" { type = string } # NAT must live in a public subnet
variable "private_subnet_ids" {
  type = list(string)
}