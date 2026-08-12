locals {
  all_services_id          = data.oci_core_services.all_services.services[0].id
  all_Services_cidr        = data.oci_core_services.all_services.services[0].cidr_block
  availability_domain_name = data.oci_identity_availability_domains.AD.availability_domains[0].name
}