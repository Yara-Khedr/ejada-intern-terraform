resource "oci_core_vcn" "YaraVCN02" {

  compartment_id = var.compartment_id
  cidr_blocks    = [var.vcn_cidr]
  display_name   = "YaraVCN02"

}

resource "oci_core_subnet" "YaraSubnet_Pub02" {

  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.YaraVCN02.id
  cidr_block                 = "10.0.1.0/24"
  display_name               = "YaraSubnet_Pub02"
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.YaraRT_Pub02.id
  security_list_ids          = [oci_core_security_list.YaraSL_Pub02.id]
}

resource "oci_core_subnet" "YaraSubnet_Priv02" {

  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.YaraVCN02.id
  cidr_block                 = "10.0.2.0/24"
  display_name               = "YaraSubnet_Priv02"
  prohibit_public_ip_on_vnic = true
  route_table_id             = oci_core_route_table.YaraRT_Priv02.id
  security_list_ids          = [oci_core_security_list.YaraSL_Priv02.id]
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

resource "oci_core_route_table" "YaraRT_Pub02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  display_name   = "YaraRT_Pub02"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.YaraIGW02.id
  }
}


resource "oci_core_route_table" "YaraRT_Priv02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  display_name   = "YaraRT_Priv02"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.YaraNATGW02.id
  }

  route_rules {
    destination       = local.all_Services_cidr
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.YaraServiceGW02.id
  }
}

resource "oci_core_security_list" "YaraSL_Pub02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  display_name   = "YaraSL_Pub02"

  ingress_security_rules {
    protocol = "6"
    source   = var.allowed_ingress_cidr
    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {

    protocol = "6"
    source   = var.allowed_ingress_cidr

    tcp_options {

      min = 443
      max = 443

    }

  }

  egress_security_rules {

    protocol    = "all"
    destination = "0.0.0.0/0"

  }

}

resource "oci_core_security_list" "YaraSL_Priv02" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.YaraVCN02.id
  display_name   = "YaraSL_Priv02"

  ingress_security_rules {
    protocol = "6"
    source   = var.vcn_cidr
    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol    = "6"
    destination = var.vcn_cidr
    tcp_options {
      min = 111
      max = 111
    }
  }

  egress_security_rules {
    protocol    = "6"
    destination = var.vcn_cidr
    tcp_options {
      min = 2048
      max = 2050
    }
  }

  egress_security_rules {
    protocol    = "17"
    destination = var.vcn_cidr
    udp_options {
      min = 111
      max = 111
    }
  }

  egress_security_rules {
    protocol    = "17"
    destination = var.vcn_cidr
    udp_options {
      min = 2048
      max = 2048
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_instance" "YaraVM02" {

  availability_domain = local.availability_domain_name
  compartment_id      = var.compartment_id
  display_name        = "YaraVM02"
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_memory_gbs
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.image.images[0].id
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.YaraSubnet_Priv02.id
    assign_public_ip = false
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)

    user_data = base64encode(templatefile("${path.module}/cloud-init.sh", {
      mount_target_ip = oci_file_storage_mount_target.YaraMT02.ip_address
      export_path     = oci_file_storage_export.YaraExport02.path
    }))
  }

}

resource "oci_file_storage_file_system" "YaraFS02" {
  compartment_id      = var.compartment_id
  availability_domain = local.availability_domain_name
  display_name        = "YaraFS02"
}

resource "oci_file_storage_mount_target" "YaraMT02" {
  compartment_id      = var.compartment_id
  availability_domain = local.availability_domain_name
  subnet_id           = oci_core_subnet.YaraSubnet_Priv02.id
  display_name        = "YaraMT02"
}

resource "oci_file_storage_export" "YaraExport02" {
  export_set_id  = oci_file_storage_mount_target.YaraMT02.export_set_id
  file_system_id = oci_file_storage_file_system.YaraFS02.id
  path           = "/YaraFS02"
}

/*resource "oci_bastion_bastion" "YaraBastion02" {
  bastion_type                 = "STANDARD"
  compartment_id               = var.compartment_id
  target_subnet_id             = oci_core_subnet.YaraSubnet_Pub02.id
  client_cidr_block_allow_list = [var.bastion_allowed_cidr]
  name                         = "YaraBastion02"
}*/