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
}
