resource "oci_core_vcn" "YaraVCN02" {

  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "YaraVCN02"

}

resource "oci_core_subnet" "YaraSubnet_Pub02" {

  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.YaraVCN02.id
  cidr_block                 = "10.0.1.0/24"
  display_name               = "YaraSubnet_Pub02"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "YaraSubnet_Priv02" {

  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.YaraVCN02.id
  cidr_block                 = "10.0.2.0/24"
  display_name               = "YaraSubnet_Priv02"
  prohibit_public_ip_on_vnic = true
}