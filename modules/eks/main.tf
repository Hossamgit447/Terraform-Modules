resource "aws_eks_cluster" "this" {
  name     = "${var.env}-eks-cluster"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids)
    security_group_ids = var.eks_security_group_ids
  }

  tags = {
    Name = "${var.env}-eks"
  }
}









