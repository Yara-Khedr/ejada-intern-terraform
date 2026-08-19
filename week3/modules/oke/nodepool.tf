resource "oci_containerengine_node_pool" "oke_node_pool" {
    cluster_id          = oci_containerengine_cluster.oke_cluster.id
    compartment_id      = var.compartment_id
    kubernetes_version  = var.kubernetes_version
    name                = var.node_pool_name
    node_shape          = var.node_shape

    node_metadata = {
        ssh_authorized_keys = var.ssh_public_key
    }

    node_shape_config {
        ocpus         = var.node_ocpus
        memory_in_gbs = var.node_memory_in_gbs
    }

    node_config_details {
        size = var.node_count

        node_pool_pod_network_option_details {
            cni_type       = "OCI_VCN_IP_NATIVE"
            pod_subnet_ids = [var.node_subnet_id]
        }

        dynamic "placement_configs" {
            for_each = var.availability_domains
            content {
                availability_domain = placement_configs.value
                subnet_id           = var.node_subnet_id
            }
        }
    }

    node_source_details {
        image_id    = var.node_image_id
        source_type = "IMAGE"
    }
}