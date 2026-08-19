locals {
  subnet_route_rules = [
    {
      destination       = "0.0.0.0/0"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = oci_core_internet_gateway.week3_ig.id
    }
  ]

  private_route_rules = [
    {
      destination       = "0.0.0.0/0"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = oci_core_nat_gateway.week3_natgw.id
    },
    {
      destination       = data.oci_core_services.all_services.services[0].cidr_block
      destination_type  = "SERVICE_CIDR_BLOCK"
      network_entity_id = oci_core_service_gateway.week3_sgw.id
    }
  ]
}