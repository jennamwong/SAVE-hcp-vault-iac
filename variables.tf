variable "region" {
  description = "The region where ..."
  type        = string
  default     = "us-east-2"
}

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-vault-hvn"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

variable "cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "hcp-vault-cluster"
}

variable "tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "plus_small"
  # default     = "dev"
}

variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "peering-id"
}

variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "hvn-route"
}