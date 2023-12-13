terraform {
  cloud {
    organization = "IAC-Project-SAVE"

    workspaces {
      name = "hcp-vault-iac"
    }
  }

  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.77.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    vault = {
      source = "hashicorp/vault"
      version = "~> 3.23.0"
    }
  }
}

provider "hcp" {
  project_id = "a167f67a-dceb-4079-9380-f9348cad8983"
}

provider "aws" {
  region = var.region
}

provider "vault" {
  # address = "https://hcp-vault-cluster-public-vault-7b9f9719.9086a747.z1.hashicorp.cloud:8200"

  address = hcp_vault_cluster.learn_hcp_vault.vault_public_endpoint_url
  token = hcp_vault_cluster_admin_token.learn_hcp_vault_token.token
}