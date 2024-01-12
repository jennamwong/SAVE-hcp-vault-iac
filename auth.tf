resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "u1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"
  ignore_absent_fields = true
  namespace = "VE"

  data_json = <<EOT
{
  "policies": ["VE-policy"],
  "password": "admin"
}
EOT
}



