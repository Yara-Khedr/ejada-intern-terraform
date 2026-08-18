output "subnet_id" {
    value = oci_core_subnet.subnet.id
    description = "The OCID of the created subnet"
}

output "route_table_id" {
    value = oci_core_route_table.subnet_route_table.id
    description = "The OCID of the subnet's route table"
}

output "security_list_id" {
    value = oci_core_security_list.subnet_security_list.id
    description = "The OCID of the subnet's security list"
}