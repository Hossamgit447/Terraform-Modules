resource "aws_security_group" "eks_sg" {
  name        = "${var.env}-sg"
  description = "Extra SG for ${var.env} EKS workloads"
  vpc_id      = var.vpc_id  # or however you expose the VPC ID from your network module

  # Example inbound rule (allow HTTP from anywhere)
  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    description = "all from vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "All"
  }
  # Example outbound rule (allow everything)
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound egress trafic"
    from_port   = 0
    to_port     = 65535
    protocol    = "All"
  }

  tags = {
    Name = "${var.env}-extra-sg"
  }
}
