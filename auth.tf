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
#---------changes----------

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "test" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/test"
  ignore_absent_fields = true
  namespace = "admin/value-engineering/academy"

  data_json = <<EOT
{
  "policies": ["user-policy"],
  "password": "admin"
}
EOT
}