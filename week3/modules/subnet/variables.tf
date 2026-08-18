variable "compartment_id" {
  description = "OCID of the compartment where resources will be created"
  type        = string
}

variable "vcn_id" {
  description = "OCID of the vcn where subnet will be created"
  type        = string
}

variable "cidr_block" {
  description = "CIDR range of the subnet"
  type        = string
}

variable "subnet_display_name" {
  description = "Display name shown in the OCI Console for the subnet"
  type        = string
}

variable "is_public" {
  description = "A value of true means the subnet is public and a value of false means private"
  type        = bool
}

variable "dns_label" {
  description = "DNS label for internal name resolution within the VCN"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules (protocol, source CIDR, and port) used to dynamically generate Security List ingress rules"
  type        = list(object({
                protocol = string
                source   = string
                port     = number
                }))
}

variable "egress_rules" {
  description = "List of egress rules (protocol, destination CIDR, and port) used to dynamically generate Security List egress rules"
  type        = list(object({
                protocol = string
                destination   = string
                port     = number
                }))
}

variable "enable_flow_logs" {
  description = "A value of true enables VCN flow logs for the subnet and a value of false disables VCN flow logs for the subnet"
  type        = bool
  default = false
}

variable "route_rules" {
  description = "List of route rules (destination and network_entity_id ) used to dynamically generate Route Table rules"
  type        = list(object({
                destination   = string
                network_entity_id     = string
                }))
}

variable "log_group_id" {
  description = "OCID of the existing Log Group that flow logs will be written to"
  type        = string
}