resource "oci_core_vcn" "week3_vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.vcn_cidr_block
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
}

resource "oci_core_internet_gateway" "week3_ig" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.week3_vcn.id
  display_name   = var.internet_gateway_display_name
  enabled        = true
}

resource "oci_core_nat_gateway" "week3_natgw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.week3_vcn.id
  display_name   = var.nat_gateway_display_name
}

resource "oci_core_service_gateway" "week3_sgw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.week3_vcn.id
  display_name   = var.service_gateway_display_name

  services {
    service_id = data.oci_core_services.all_services.services[0].id
  }
}

resource "oci_logging_log_group" "week3_log_group" {
  compartment_id = var.compartment_id
  display_name   = var.log_group_display_name
}