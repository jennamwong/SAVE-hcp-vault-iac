# Terraform settings
terraform {
  # Terraform Cloud settings
  cloud {
    # The name of the organization in Terraform Cloud
    organization = "IAC-Project-SAVE"

    # The name of the workspace in Terraform Cloud
    workspaces {
      name = "hcp-vault-iac"
    }
  }

  # The providers required for this configuration
  required_providers {
    # The HCP provider is used to manage resources in HashiCorp Cloud Platform
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.77.0"
    }
    # The AWS provider is used to manage resources in Amazon Web Services
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # The Vault provider is used to manage resources in HashiCorp Vault
    vault = {
      source = "hashicorp/vault"
      version = "~> 3.23.0"
    }
  }
}

# Configure the HCP provider
provider "hcp" {
  # The ID of the project in HCP
  project_id = "a167f67a-dceb-4079-9380-f9348cad8983"
}

# Configure the AWS provider
provider "aws" {
  # The region where the AWS resources will be created
  region = var.region
}

# Configure the Vault provider
provider "vault" {
  # The address of the Vault server
  address = hcp_vault_cluster.learn_hcp_vault.vault_public_endpoint_url
  # The token used to authenticate with the Vault server
  token = hcp_vault_cluster_admin_token.learn_hcp_vault_token.token
}