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
  }
}

provider "hcp" {}

provider "aws" {
  region = var.region
}