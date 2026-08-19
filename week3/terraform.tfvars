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
ssh_public_key                = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBtJPLcIm8T/R1/Gl1t9NjrTIBgiof7abPqYY5mNeXmMP4PW34Cl5Nn9+W28rjvlheROLllUQQ7r+RMnYt3ewKpEKuk51UyAmW9y6WhrqWz2p/MpGp2qA0Bk/ICtAVUoEaolLn2YL4yBoI+WsVO9ZjjS3Ha4WxNfqEJTwuqKgcb3GWpbmLMkGMofKY6uEnbbKPcAscZmBsrCjqgi/ErX9wDou523Ba17FOpTjWObiUtcwKMRlUvRlUe/BiFyl6WyovAKK9qqPnGuHu0Q7s+WlSAfhgj4ANuxK39EPEJJXldkvlMpjmgT2FIEwq4gXZ4r69x3GsfxhCXzf/zfgO5L1p yaraa@Yuri"
ingress_rules = [
  {
    protocol = "6"
    source   = "0.0.0.0/0"
    port     = 80
  },
  {
    protocol = "6"
    source   = "10.0.2.0/24"
    port     = 6443
  },
  {
    protocol = "6"
    source   = "10.0.2.0/24"
    port     = 12250
  },
  {
    protocol = "1"
    source   = "10.0.2.0/24"
    port     = 0
  }
]

egress_rules = [
  {
    protocol    = "all"
    destination = "0.0.0.0/0"
    port        = 0
  }
]

oke_cluster_name     = "Yara-W3-OKE-Cluster"
kubernetes_version   = "v1.34.2"
pods_cidr            = "10.244.0.0/16"
services_cidr        = "10.96.0.0/16"
node_pool_name       = "Yara-W3-NodePool01"
node_shape           = "VM.Standard.A1.Flex"
node_count           = 2
node_image_id        = "ocid1.image.oc1.me-jeddah-1.aaaaaaaagbq3nytwrgns4a4dgzpmf4uvlazgz6xgb4co7o5bdsbf53qrr3aa"
availability_domains = ["oXVt:ME-JEDDAH-1-AD-1"]
node_ocpus           = 1
node_memory_in_gbs   = 8

nat_gateway_display_name    = "Yara-W3-NATGW"
private_subnet_cidr_block   = "10.0.2.0/24"
private_subnet_display_name = "Yara-W3-Private01"
private_subnet_dns_label    = "yaraw3priv01"

private_ingress_rules = [
  {
    protocol = "all"
    source   = "10.0.0.0/16"
    port     = 0
  },
  {
    protocol = "1"
    source   = "0.0.0.0/0"
    port     = 0
  }
]

private_egress_rules = [
  {
    protocol    = "all"
    destination = "0.0.0.0/0"
    port        = 0
  }
]

service_gateway_display_name = "Yara-W3-SGW"