variable "region" {
  type        = string
  description = " OCI region to deploy resources into"
}

variable "compartment_id" {
  description = "OCID of my compartment where resources will be created (intern-17-yara-khedr-cmp)"
  type        = string
}