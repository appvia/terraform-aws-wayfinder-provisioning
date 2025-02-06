resource "aws_subnet" "private" {
  count = var.layout_private_subnets

  vpc_id            = aws_vpc.wayfinder.id
  cidr_block        = cidrsubnet(var.cidr_node, 2, 1 + count.index)
  availability_zone = data.aws_availability_zones.wayfinder.names[count.index]

  tags = {
    "kubernetes.io/role/internal-elb" = 1
    Network                           = "private"
  }
}

resource "aws_route_table" "private_nat_gateway" {
  count = var.layout_private_subnets

  vpc_id = aws_vpc.wayfinder.id

  tags = {
    Name = "${var.cloud_resource}-nat-gateway-${data.aws_availability_zones.wayfinder.zone_ids[count.index]}"
  }
}

resource "aws_route" "private_nat_gateway" {
  count = var.layout_private_subnets

  route_table_id         = resource.aws_route_table.private_nat_gateway[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public[count.index].id
}

resource "aws_route_table_association" "private_nat_gateway" {
  count = var.layout_private_subnets

  route_table_id = aws_route_table.private_nat_gateway[count.index].id
  subnet_id      = aws_subnet.private[count.index].id
}