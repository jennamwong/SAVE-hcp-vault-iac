# The AWS region where the resources will be created.
variable "region" {
  description = "The region where ..."
  type        = string
  default     = "us-east-2"
}

# The ID of the HashiCorp Virtual Network (HVN) in HCP.
variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-vault-hvn"
}

# The cloud provider for the HCP HVN and Vault cluster. Currently, only AWS is supported.
variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

# The ID of the Vault cluster in HCP.
variable "cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "hcp-vault-cluster"
}

# The tier of the HCP Vault cluster. This can be "dev" or "plus_small". 
# Note: You can only upgrade the tier, not downgrade.
variable "tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  # default     = "plus_small" 
  default     = "dev"
}

# The ID of the peering connection between the HVN and the AWS VPC.
variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "peering-id"
}

# The ID of the route in the HVN for the peering connection.
variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "hvn-route"
}