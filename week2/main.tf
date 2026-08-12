resource "oci_core_vcn" "YaraVCN02" {

  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "YaraVCN02"

}