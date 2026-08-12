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
    security_list_ids = [oci_core_security_list.YaraSL_NFS.id]
}

resource "oci_core_security_list" "YaraSL_NFS" {
    compartment_id = var.compartment_id
    vcn_id         = oci_core_vcn.YaraVCN01.id
    display_name   = "YaraSL-NFS"

    ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
        min = 22
        max = 22
    }
    }

    ingress_security_rules {

        protocol = "6"
        source   = "10.0.1.0/24"

        tcp_options {

            min = 2048
            max = 2050

        }

    }

    ingress_security_rules {

        protocol = "6"
        source   = "10.0.1.0/24"

        tcp_options {

            min = 111
            max = 111

        }

    }

    ingress_security_rules {

        protocol = "17"
        source   = "10.0.1.0/24"

        udp_options {

            min = 2048
            max = 2048

        }

    }

    ingress_security_rules {

        protocol = "17"
        source   = "10.0.1.0/24"

        udp_options {

            min = 111
            max = 111

        }

    }

    egress_security_rules {

        protocol    = "all"
        destination = "0.0.0.0/0"

    }

}