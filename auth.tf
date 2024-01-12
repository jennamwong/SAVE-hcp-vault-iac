resource "vault_auth_backend" "userpass" {
  type = "userpass"
  # path = "auth/userpass"
}

resource "vault_generic_endpoint" "u1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["super-admin-policy"],
  "password": "admin"
}
EOT
}



