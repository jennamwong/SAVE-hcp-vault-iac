resource "vault_auth_backend" "github" {
  type = "github"
}

# resource "vault_auth_backend" "ldap" {
#   type = "ldap"
# }

# resource "vault_auth_backend" "okta" {
#   type = "okta"
# }

resource "vault_github_auth_backend" "github" {
  organization = "IAC-Project-SAVE"
}