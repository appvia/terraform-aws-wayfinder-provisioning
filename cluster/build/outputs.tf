output "fqdn" {
  description = "The domain name of the kubernetes cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The name of the kubernetes cluster"
  value = module.eks.cluster_name
}

output "ca_certificate" {
  description = "The ca certificate of the kubernetes cluster"
  value = module.eks.cluster_certificate_authority_data
}

output "kubernetes_version" {
  description = "The version of the kubernetes cluster"
  value = module.eks.cluster_version
}
