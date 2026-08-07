resource "oci_core_vcn" "YaraVCN01" {

  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "YaraVCN01"

}

resource "oci_core_internet_gateway" "YaraIGW01" {

    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.YaraVCN01.id
    enabled = true
    display_name = "YaraIGW01"

}

resource "oci_core_route_table" "YaraRT_Pub01" {
    
    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.YaraVCN01.id
    display_name = "YaraRT-Pub01" 

    route_rules {
        
        network_entity_id = oci_core_internet_gateway.YaraIGW01.id
        destination = "0.0.0.0/0"

    }

}

resource "oci_core_subnet" "YaraSubnet_Pub01" {

    compartment_id = var.compartment_id
    vcn_id = oci_core_vcn.YaraVCN01.id
    cidr_block = "10.0.1.0/24"
    display_name = "YaraSubnet-Pub01"
    route_table_id = oci_core_route_table.YaraRT_Pub01.id
}
