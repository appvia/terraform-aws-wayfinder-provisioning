resource "aws_subnet" "public" {
  count = var.layout_public_subnets

  vpc_id            = aws_vpc.wayfinder.id
  cidr_block        = cidrsubnet(var.cidr_node, 4, count.index)
  availability_zone = data.aws_availability_zones.wayfinder.names[count.index]

  tags = {
    "kubernetes.io/role/elb" = 1
    Network                  = "public"
  }
}

resource "aws_route_table" "public_internet" {
  vpc_id = aws_vpc.wayfinder.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wayfinder.id
  }

  tags = {
    Name = "${var.cloud_resource}-internet"
  }
}

resource "aws_route_table_association" "public_internet" {
  count = var.layout_public_subnets

  route_table_id = aws_route_table.public_internet.id
  subnet_id      = aws_subnet.public[count.index].id
}

resource "aws_eip" "public_nat_gateway" {
  count = var.layout_public_subnets

  domain = "vpc"
}

resource "aws_nat_gateway" "public" {
  count = var.layout_public_subnets

  allocation_id = aws_eip.public_nat_gateway[count.index].allocation_id
  subnet_id     = aws_subnet.public[count.index].id
}