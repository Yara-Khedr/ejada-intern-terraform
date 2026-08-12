locals {
  all_services_id   = data.oci_core_services.all_services.services[0].id
  all_Services_cidr = data.oci_core_services.all_services.services[0].cidr_block
}