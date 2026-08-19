terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }

  backend "oci" {
    bucket              = "yara-w3-tfstate"
    namespace           = "axkjllkftxfz"
    key                 = "week3/terraform.tfstate"
    config_file_profile = "DEFAULT"
  }
}

provider "oci" {
  auth   = "APIKey"
  region = var.region
}