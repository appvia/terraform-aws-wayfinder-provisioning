variable "cloud_resource" {
  description = "The name of the network to create"
  type        = string
}

variable "cidr_node" {
  description = "The ip range used by this network"
  type        = string
}

variable "region" {
  description = "The region in which to build the network"
  type        = string
}

variable "layout_private_subnets" {
  description = "The number of private subnets to created"
  type        = number
}

variable "layout_public_subnets" {
  description = "The number of public subnets to create"
  type        = number
}