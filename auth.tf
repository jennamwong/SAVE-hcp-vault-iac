resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "u1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/u1"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["user-policy"],
  "password": "changeme"
}
EOT
}