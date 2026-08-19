variable "region" {
  type        = string
  description = " OCI region to deploy resources into"
}

variable "compartment_id" {
  description = "OCID of the compartment resources will be created in"
  type        = string
}

variable "vcn_cidr_block" {
  description = "List of CIDR blocks for the VCN"
  type        = list(string)
}

variable "vcn_display_name" {
  description = "Display name shown in the OCI Console for the vcn"
  type        = string
}

variable "vcn_dns_label" {
  description = "DNS label for the VCN"
  type        = string
}

variable "internet_gateway_display_name" {
  description = "Display name for the Internet Gateway"
  type        = string
}

variable "log_group_display_name" {
  description = "Display name for the Log Group that will hold flow logs"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet created via the module"
  type        = string
}

variable "subnet_display_name" {
  description = "Base display name for the subnet and its related resources"
  type        = string
}

variable "subnet_dns_label" {
  description = "DNS label for the subnet created via the module"
  type        = string
}

variable "is_public" {
  description = "Whether the subnet created via the module is public (true) or private (false)"
  type        = bool
}

variable "ingress_rules" {
  description = "List of ingress rules (protocol, source CIDR, port) passed into the subnet module"
  type = list(object({
    protocol = string
    source   = string
    port     = number
  }))
}

variable "egress_rules" {
  description = "List of egress rules (protocol, destination CIDR, port) passed into the subnet module"
  type = list(object({
    protocol    = string
    destination = string
    port        = number
  }))
}


variable "enable_flow_logs" {
  description = "Whether to enable VCN flow logs for the subnet created via the module"
  type        = bool
  default     = false
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for accessing worker nodes"
}

variable "oke_cluster_name" {
  description = "Display name for the OKE cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the OKE cluster and node pool"
  type        = string
}

variable "pods_cidr" {
  description = "CIDR block for Kubernetes pods (VCN-native networking)"
  type        = string
}

variable "services_cidr" {
  description = "CIDR block for Kubernetes services"
  type        = string
}

variable "node_pool_name" {
  description = "Display name for the OKE node pool"
  type        = string
}

variable "node_shape" {
  description = "VM shape for OKE worker nodes"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes in the node pool"
  type        = number
}

variable "node_image_id" {
  description = "OCID of the worker node image"
  type        = string
}

variable "availability_domains" {
  description = "List of availability domain names for node pool placement"
  type        = list(string)
}

variable "node_ocpus" {
  description = "OCPUs per worker node"
  type        = number
}

variable "node_memory_in_gbs" {
  description = "Memory in GB per worker node"
  type        = number
}

variable "nat_gateway_display_name" {
  description = "Display name for the NAT Gateway"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_subnet_display_name" {
  description = "Base display name for the private subnet"
  type        = string
}

variable "private_subnet_dns_label" {
  description = "DNS label for the private subnet"
  type        = string
}

variable "private_ingress_rules" {
  description = "Ingress rules for the private subnet (intra-VCN only)"
  type = list(object({
    protocol = string
    source   = string
    port     = number
  }))
}

variable "private_egress_rules" {
  description = "Egress rules for the private subnet"
  type = list(object({
    protocol    = string
    destination = string
    port        = number
  }))
}

variable "service_gateway_display_name" {
  description = "Display name for the Service Gateway"
  type        = string
}