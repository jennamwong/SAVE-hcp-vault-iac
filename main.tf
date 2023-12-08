terraform {
  cloud {
    organization = "IAC-Project-SAVE"

    workspaces {
      name = "hcp-vault-iac"
    }
  }
}