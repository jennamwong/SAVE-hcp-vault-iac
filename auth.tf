resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_auth_backend" "userpass_ve" {
  type = "userpass"
  namespace = "VE"
}

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

# -----------------------------

# resource "vault_identity_oidc_key" "test" {
#   name               = "my-key"
#   allowed_client_ids = ["*"]
#   rotation_period    = 3600
#   verification_ttl   = 3600
# }

# resource "vault_identity_oidc_assignment" "test" {
#   name       = "my-assignment"
#   entity_ids = ["fake-ascbascas-2231a-sdfaa"]
#   group_ids  = ["fake-sajkdsad-32414-sfsada"]
# }

# resource "vault_identity_oidc_client" "test" {
#   name          = "application"
#   key           = vault_identity_oidc_key.test.name
#   redirect_uris = [
#     "http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback",
#     "http://127.0.0.1:8251/callback",
#     "http://127.0.0.1:8080/callback"
#   ]
#   assignments = [
#     vault_identity_oidc_assignment.test.name
#   ]
#   id_token_ttl     = 2400
#   access_token_ttl = 7200
# }

# resource "vault_identity_oidc_scope" "test" {
#   name        = "groups"
#   template    = jsonencode(
#   {
#     groups = "{{identity.entity.groups.names}}",
#   }
#   )
#   description = "Groups scope."
# }

# resource "vault_identity_oidc_provider" "test" {
#   name = "my-provider"
#   https_enabled = false
#   issuer_host = "127.0.0.1:8200"
#   allowed_client_ids = [
#     vault_identity_oidc_client.test.client_id
#   ]
#   scopes_supported = [
#     vault_identity_oidc_scope.test.name
#   ]
# }

resource "vault_jwt_auth_backend" "oidc" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "oidc"
    type                = "oidc"
    oidc_discovery_url  = "https://login.microsoftonline.com/237fbc04-c52a-458b-af97-eaf7157c0cd4/v2.0"
    oidc_client_id      = "552c7f11-47fe-4557-bc7a-aead517d0e6e"
    oidc_client_secret  = "TUh8Q~vVlG.xJ5PfpfInHpehPX0GVSsLUCzc-con"
    default_role        = "test-role"
}

resource "vault_jwt_auth_backend_role" "example" {
  backend         = vault_jwt_auth_backend.oidc.path
  role_name       = "test-role"
  token_policies  = ["super-policy"]

  user_claim            = "email"
  role_type             = "oidc"
  allowed_redirect_uris = [
    "https://hcp-vault-cluster-public-vault-fea3e4a5.d6db98c2.z1.hashicorp.cloud:8200/ui/vault/auth/oidc/oidc/callback",
    "https://localhost:8250/oidc/callback"
  ]
}