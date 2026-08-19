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

module "oke" {
  source = "./modules/oke"

  compartment_id     = var.compartment_id
  vcn_id             = oci_core_vcn.week3_vcn.id
  cluster_name       = var.oke_cluster_name
  kubernetes_version = var.kubernetes_version
  cluster_subnet_id  = module.subnet.subnet_id
  pods_cidr          = var.pods_cidr
  services_cidr      = var.services_cidr

  node_pool_name       = var.node_pool_name
  node_shape           = var.node_shape
  node_count           = var.node_count
  node_subnet_id       = module.private_subnet.subnet_id
  node_image_id        = var.node_image_id
  ssh_public_key       = var.ssh_public_key
  availability_domains = var.availability_domains
  node_ocpus           = var.node_ocpus
  node_memory_in_gbs   = var.node_memory_in_gbs
}

module "private_subnet" {
  source = "./modules/subnet"

  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.week3_vcn.id
  cidr_block          = var.private_subnet_cidr_block
  subnet_display_name = var.private_subnet_display_name
  dns_label           = var.private_subnet_dns_label
  is_public           = false
  ingress_rules       = var.private_ingress_rules
  egress_rules        = var.private_egress_rules
  route_rules         = local.private_route_rules
  enable_flow_logs    = var.enable_flow_logs
  log_group_id        = oci_logging_log_group.week3_log_group.id
}