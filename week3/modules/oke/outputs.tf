output "cluster_id" {
  value       = oci_containerengine_cluster.oke_cluster.id
  description = "OCID of the OKE cluster"
}

output "cluster_name" {
  value       = oci_containerengine_cluster.oke_cluster.name
  description = "Display name of the OKE cluster"
}

output "node_pool_id" {
  value       = oci_containerengine_node_pool.oke_node_pool.id
  description = "OCID of the OKE node pool"
}