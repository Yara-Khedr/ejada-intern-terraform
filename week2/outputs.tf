output "lb_public_ip" {
  value       = oci_load_balancer_load_balancer.YaraLB02.ip_address_details[0].ip_address
  description = "Public IP address of the Application Load Balancer"
}

output "vm_private_ip" {
  value       = oci_core_instance.YaraVM02.private_ip
  description = "Private IP address of the private compute instance"
}

output "jump_vm_public_ip" {
  value       = oci_core_instance.YaraJumpVM02.public_ip
  description = "Public IP address of the Jump VM"
}

output "mount_target_ip" {
  value       = oci_file_storage_mount_target.YaraMT02.ip_address
  description = "Private IP address of the FSS mount target"
}

output "fss_export_path" {
  value       = oci_file_storage_export.YaraExport02.path
  description = "NFS export path for mounting the file system"
}
