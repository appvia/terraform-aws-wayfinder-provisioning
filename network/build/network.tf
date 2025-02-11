resource "aws_vpc" "wayfinder" {
  cidr_block = var.cidr_node

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.cloud_resource
  }
}

resource "aws_internet_gateway" "wayfinder" {
  vpc_id = aws_vpc.wayfinder.id
}

resource "aws_security_group" "wayfinder" {
  vpc_id = aws_vpc.wayfinder.id
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.wayfinder.id
}