locals {
  all_services_id = data.oci_core_services.all_services.services[0].id
}