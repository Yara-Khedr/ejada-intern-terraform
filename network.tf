resource "oci_core_vcn" "YaraVCN01" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "YaraVCN01"
}