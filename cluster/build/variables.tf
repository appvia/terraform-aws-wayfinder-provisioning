variable "cloud_resource" {
  description = "The name to use for any created cloud resources"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of kubernetes used to build this cluster"
  type        = string
}

variable "vpc_id" {
  description = "The id of the vpc in which the cluster should be build"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet this cluster should use for networking"
  type        = list(string)
}