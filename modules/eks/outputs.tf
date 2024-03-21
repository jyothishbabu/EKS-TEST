output "endpoint" {
  value = aws_eks_cluster.JbKanerikaEks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.JbKanerikaEks.certificate_authority[0].data
}
output "cluster_id" {
  value = aws_eks_cluster.JbKanerikaEks.id
}
output "cluster_endpoint" {
  value = aws_eks_cluster.JbKanerikaEks.endpoint
}
output "cluster_name" {
  value = aws_eks_cluster.JbKanerikaEks.name
}
