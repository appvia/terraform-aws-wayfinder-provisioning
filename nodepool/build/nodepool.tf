module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"

  name            = var.cloud_resource
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  subnet_ids = var.subnet_ids

  cluster_primary_security_group_id = data.aws_eks_cluster.eks.vpc_config.0.cluster_security_group_id
  vpc_security_group_ids = data.aws_eks_cluster.eks.vpc_config.0.security_group_ids

  min_size     = var.min_size
  max_size     = var.max_size
  desired_size = var.size

  instance_types = var.instance_types

  cluster_service_cidr = data.aws_eks_cluster.eks.kubernetes_network_config.0.service_ipv4_cidr
}