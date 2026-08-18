locals {
  subnet_route_rules = [
    {
      destination       = "0.0.0.0/0"
      network_entity_id = oci_core_internet_gateway.week3_ig.id
    }
  ]
}