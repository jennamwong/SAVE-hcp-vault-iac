resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_auth_backend" "userpass_ve" {
  type = "userpass"
  namespace = "VE"
}

# resource "vault_auth_backend" "userpass_sea" {
#   type = "userpass"
#   namespace = "SEA"
# }

# resource "vault_auth_backend" "userpass_cs" {
#   type = "userpass"
#   namespace = "CS"
# }

resource "vault_generic_endpoint" "u1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/super"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["super-policy"],
  "password": "test"
}
EOT
}

resource "vault_generic_endpoint" "u2" {
  depends_on           = [vault_auth_backend.userpass_ve]
  path                 = "auth/userpass/users/vesenior"
  ignore_absent_fields = true
  namespace = "VE"

  data_json = <<EOT
{
  "policies": ["VE-policy-senior"],
  "password": "test"
}
EOT
}

resource "vault_generic_endpoint" "u3" {
  depends_on           = [vault_auth_backend.userpass_ve]
  path                 = "auth/userpass/users/vejunior"
  ignore_absent_fields = true
  namespace = "VE"

  data_json = <<EOT
{
  "policies": ["VE-policy-junior"],
  "password": "test"
}
EOT
}

