data "aws_caller_identity" "current" {}

data "aws_availability_zones" "wayfinder" {}

data "aws_availability_zone" "wayfinder" {
  for_each = toset(data.aws_availability_zones.wayfinder.names)
  name     = each.value
}

locals {
  az_count = max(var.layout_private_subnets, var.layout_public_subnets)
  az_names = sort(data.aws_availability_zones.wayfinder.names)
  az_map = {
    for zone in data.aws_availability_zone.wayfinder :
    zone.name => zone.zone_id
  }
  az_ids = [for name in local.az_names : local.az_map[name]]
}