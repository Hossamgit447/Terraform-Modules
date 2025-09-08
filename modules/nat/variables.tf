variable "env"               { type = string }
variable "vpc_id"            { type = string }
variable "public_subnet_ids" { type = list(string) } # NAT lives here
variable "private_subnet_ids"{ type = list(string) }