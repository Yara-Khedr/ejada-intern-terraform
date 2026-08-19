variable "compartment_id" {
  type        = string
  description = "OCID of the compartment where OKE resources will be created"
}

variable "vcn_id" {
  type        = string
  description = "OCID of the VCN the cluster and node pool will use"
}

variable "cluster_name" {
  type        = string
  description = "Display name for the OKE cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to run on the cluster, e.g. v1.29.1"
}

variable "cluster_subnet_id" {
  type        = string
  description = "OCID of the subnet hosting the Kubernetes API endpoint"
}

variable "pods_cidr" {
  type        = string
  description = "CIDR block reserved for pod IPs (VCN-native pod networking)"
}

variable "services_cidr" {
  type        = string
  description = "CIDR block reserved for internal Kubernetes services"
}

variable "node_pool_name" {
  type        = string
  description = "Display name for the node pool"
}

variable "node_shape" {
  type        = string
  description = "VM shape for worker nodes, e.g. VM.Standard.E4.Flex"
}

variable "node_count" {
  type        = number
  description = "Number of worker nodes in the node pool"
  default     = 2
}

variable "node_subnet_id" {
  type        = string
  description = "OCID of the subnet hosting the worker nodes"
}

variable "ssh_public_key" {
  type        = string
  description = "Public SSH key for accessing worker nodes"
}

variable "availability_domains" {
  type        = list(string)
  description = "List of availability domain names to spread node pool placement across"
}

variable "node_image_id" {
  type        = string
  description = "OCID of the image to use for worker nodes"
}

variable "node_ocpus" {
  type        = number
  description = "Number of OCPUs per worker node"
}

variable "node_memory_in_gbs" {
  type        = number
  description = "Memory in GB per worker node"
}