resource "aws_eks_cluster" "this" {
  name     = "${var.env}-eks-cluster"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids)
  }

  tags = {
    Name = "${var.env}-eks"
  }
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}