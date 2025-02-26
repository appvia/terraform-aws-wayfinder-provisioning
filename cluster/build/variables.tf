variable "cloud_resource" {
  description = "The name to use for any created cloud resources"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of kubernetes used to build this cluster"
  type        = string
}

variable "region" {
  description = "The region in which to build the cluster"
  type        = string
}

variable "vpc_id" {
  description = ""
  type        = string
}

variable "subnet_ids" {
  description = ""
  type        = list(string)
}