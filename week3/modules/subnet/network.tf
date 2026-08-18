resource "oci_core_route_table" "subnet_route_table" {
    
    compartment_id = var.compartment_id
    vcn_id = var.vcn_id
    display_name = "${var.subnet_display_name}-rt"

    dynamic "route_rules" {
        for_each = var.route_rules
        content {
            network_entity_id = route_rules.value.network_entity_id 
            destination = route_rules.value.destination
            destination_type = "CIDR_BLOCK"
        }
    }
}

resource "oci_core_security_list" "subnet_security_list" {
    compartment_id = var.compartment_id
    vcn_id         = var.vcn_id
    display_name   = "${var.subnet_display_name}-sl"

    dynamic "ingress_security_rules" {
        for_each = var.ingress_rules
        content {
            protocol = ingress_security_rules.value.protocol
            source = ingress_security_rules.value.source
        }
    }

    dynamic "egress_security_rules" {
        for_each = var.egress_rules
        content {
            protocol = egress_security_rules.value.protocol
            destination = egress_security_rules.value.destination
        }
    }
}

resource "oci_core_subnet" "subnet" {
    compartment_id = var.compartment_id
    vcn_id         = var.vcn_id
    cidr_block = var.cidr_block
    dns_label = var.dns_label
    display_name   = "${var.subnet_display_name}-subnet"
    prohibit_public_ip_on_vnic = var.is_public ? false : true
    route_table_id = oci_core_route_table.subnet_route_table.id
    security_list_ids = [oci_core_security_list.subnet_security_list.id]
}

resource "oci_logging_log" "subnet_flow_log" {
    count = var.enable_flow_logs ? 1 : 0
    display_name = "${var.subnet_display_name}-flowlog"
    log_group_id = var.log_group_id
    log_type = "SERVICE"
    is_enabled = true

    configuration {
        source {
            category = "all"
            resource = oci_core_subnet.subnet.id
            service = "flowlogs"
            source_type = "OCISERVICE"
        }
    }
}