resource "vault_auth_backend" "userpass" {
  type = "userpass"
  path = "customer-success/userpass"
}

resource "vault_generic_endpoint" "u1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/customer-success/userpass/users/admin"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["CS-policy"],
  "password": "admin"
}
EOT
}



