output "VM_Pub_IP" {

  description = "Public IP of YaraVM01 compute instance"
  value       = oci_core_instance.YaraVM01.public_ip

}

output "MT_Priv_IP" {

  description = "Private IP of the File Storage mount target"
  value       = oci_file_storage_mount_target.YaraMT01.ip_address
  
}