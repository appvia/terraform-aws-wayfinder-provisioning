output "account_id" {
  description = "blank"
  value       = data.aws_caller_identity.current.account_id
}

output "availability_zone_ids" {
  description = "blank"
  value       = slice(data.aws_availability_zones.wayfinder.zone_ids, 0, local.az_count)
}

output "availability_zone_names" {
  description = "blank"
  value       = slice(data.aws_availability_zones.wayfinder.names, 0, local.az_count)
}

output "private_subnet_ids" {
  description = "blank"
  value       = aws_subnet.private.*.id
}

output "private_ipv4_addresses" {
  description = "blank"
  value       = aws_subnet.private.*.cidr_block
}

output "public_subnet_ids" {
  description = "blank"
  value       = aws_subnet.public.*.id
}

output "public_ipv4_addresses" {
  description = "blank"
  value       = aws_subnet.private.*.cidr_block
}

output "vpc_id" {
  description = "blank"
  value       = resource.aws_vpc.wayfinder.id
}

output "ipv4_egress_adresses" {
  description = "blank"
  value       = resource.aws_eip.public_nat_gateway.*.public_ip
}

output "security_groups" {
  description = "blank"
  value       = [resource.aws_security_group.wayfinder.id]
}