module "subnet" {
  source = "./modules/subnet"

  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.week3_vcn.id
  cidr_block          = var.subnet_cidr_block
  subnet_display_name = var.subnet_display_name
  is_public           = var.is_public
  dns_label           = var.subnet_dns_label
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
  route_rules         = local.subnet_route_rules
  enable_flow_logs    = var.enable_flow_logs
  log_group_id        = oci_logging_log_group.week3_log_group.id
}