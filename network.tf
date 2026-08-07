resource "oci_core_vcn" "YaraVCN01" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "YaraVCN01"
}

resource "oci_core_internet_gateway" "YaraIGW01" {
    #Required
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.YaraVCN01.id

    enabled = true
    display_name = "YaraIGW01"
}