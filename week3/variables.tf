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