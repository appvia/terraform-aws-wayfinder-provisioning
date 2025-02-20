variable "cloud_resource" {
  description = "The name to use for the nodepool"
  type        = string
}

variable "cluster_name" {
  description = "The name of the cluster in which this nodepool should be created"
  type        = string
}

variable "kubernetes_version" {
  description = "The kubernets version of the nodes in this nodepool"
  type = string
}

variable "min_size" {
  description = "The minumum size of the nodepool"
  type = number
}

variable "max_size" {
  description = "The maximum size of this nodepool"
  type = number
}

variable "size" {
  description = "The default size of this nodepool"
  type = number
}

variable "subnet_ids" {
  description = "The IDs of the subnets nodes should be created in"
  type = list(string)
}

variable "instance_types" {
  description = "The instance types that should be used in this nodepool"
  type = list(string)
}