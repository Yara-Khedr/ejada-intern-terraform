variable "region" {
  type        = string
  description = " OCI region to deploy resources into"
}

variable "compartment_id" {
  description = "OCID of my compartment where resources will be created (intern-17-yara-khedr-cmp)"
  type        = string
}

variable "allowed_ingress_cidr" {
  type        = string
  description = "CIDR range allowed to send inbound traffic to the public subnet"
}

variable "vcn_cidr" {
  type        = string
  description = "CIDR range of VCN"
}

variable "instance_shape" {
  type        = string
  description = "Compute shape for the private instance (Free Tier ARM Flex shape)"
}

variable "instance_ocpus" {
  type        = number
  description = "Number of OCPUs allocated to the private instance"
}

variable "instance_memory_gbs" {
  type        = number
  description = "Amount of memory in GB allocated to the private instance"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Local file path to the SSH public key used to access the private instance"
}

variable "bastion_allowed_cidr" {
  type        = string
  description = "CIDR range allowed to initiate Bastion sessions"
}