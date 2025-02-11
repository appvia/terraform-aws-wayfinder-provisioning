output "account_id" {
  description = "The ID of the account this network was built in"
  value       = data.aws_caller_identity.current.account_id
}

output "availability_zone_ids" {
  description = "A list of the IDs of the AZs this network was built in"
  value       = slice(data.aws_availability_zones.wayfinder.zone_ids, 0, local.az_count)
}

output "availability_zone_names" {
  description = "A list of the names of the AZs this network was built in"
  value       = slice(data.aws_availability_zones.wayfinder.names, 0, local.az_count)
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets built by this module"
  value       = aws_subnet.private.*.id
}

output "private_ipv4_addresses" {
  description = "The ip ranges of the created private subnets"
  value       = aws_subnet.private.*.cidr_block
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets built by this module"
  value       = aws_subnet.public.*.id
}

output "public_ipv4_addresses" {
  description = "The ip ranges of the created private subnets"
  value       = aws_subnet.private.*.cidr_block
}

output "vpc_id" {
  description = "The id of the created vpc"
  value       = resource.aws_vpc.wayfinder.id
}

output "ipv4_egress_adresses" {
  description = "The egress addresses of the created networks"
  value       = resource.aws_eip.public_nat_gateway.*.public_ip
}

output "security_groups" {
  description = "A list of security groups created by this network"
  value       = [resource.aws_security_group.wayfinder.id]
}