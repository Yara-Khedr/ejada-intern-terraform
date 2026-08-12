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

resource "oci_core_internet_gateway" "YaraIGW02" {

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  enabled        = true
  display_name   = "YaraIGW02"

}

resource "oci_core_nat_gateway" "YaraNATGW02" {

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  display_name   = "YaraNATGW02"
  block_traffic  = false

}

resource "oci_core_service_gateway" "YaraServiceGW02" {

  compartment_id = var.compartment_id

  services {

    service_id = local.all_services_id

  }

  vcn_id       = oci_core_vcn.YaraVCN02.id
  display_name = "YaraServiceGW02"
}