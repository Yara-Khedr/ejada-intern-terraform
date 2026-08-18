region                        = "me-jeddah-1"
compartment_id                = "ocid1.compartment.oc1..aaaaaaaauhqrwvwzpavy2cuiayyinuryeppiplca5yctnpiomlfrivwirnna"
vcn_cidr_block                = ["10.0.0.0/16"]
vcn_display_name              = "Yara-W3-VCN"
vcn_dns_label                 = "yaraw3vcn"
internet_gateway_display_name = "Yara-W3-IG"
log_group_display_name        = "Yara-W3-LogGroup"
subnet_cidr_block             = "10.0.1.0/24"
subnet_display_name           = "Yara-W3-Public01"
subnet_dns_label              = "yaraw3pub01"
is_public                     = true
ingress_rules = [
  {
    protocol = "6"
    source   = "0.0.0.0/0"
    port     = 80
  }
]

egress_rules = [
  {
    protocol    = "all"
    destination = "0.0.0.0/0"
    port        = 0
  }
]