resource "oci_containerengine_cluster" "oke_cluster" {
    compartment_id = var.compartment_id
    kubernetes_version = var.kubernetes_version
    name = var.cluster_name
    vcn_id = var.vcn_id

    cluster_pod_network_options {
        cni_type = "OCI_VCN_IP_NATIVE"
    }

    endpoint_config {
        subnet_id = var.cluster_subnet_id
        is_public_ip_enabled = true
    }

    options {
        service_lb_subnet_ids = [var.cluster_subnet_id]

        kubernetes_network_config {
            pods_cidr     = var.pods_cidr
            services_cidr = var.services_cidr
        }
    }
}