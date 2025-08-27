output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}