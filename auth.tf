# Enable the userpass auth method at the default path.
resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

# Enable the userpass auth method at the "VE" namespace.
resource "vault_auth_backend" "userpass_ve" {
  type      = "userpass"
  namespace = "VE"
}

# Create a user named "super" in the userpass auth method.
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

# Create a user named "vesenior" in the userpass auth method under the "VE" namespace.
resource "vault_generic_endpoint" "u2" {
  depends_on           = [vault_auth_backend.userpass_ve]
  path                 = "auth/userpass/users/vesenior"
  ignore_absent_fields = true
  namespace            = "VE"

  data_json = <<EOT
{
  "policies": ["VE-policy-senior"],
  "password": "test"
}
EOT
}

# Create a user named "vejunior" in the userpass auth method under the "VE" namespace.
resource "vault_generic_endpoint" "u3" {
  depends_on           = [vault_auth_backend.userpass_ve]
  path                 = "auth/userpass/users/vejunior"
  ignore_absent_fields = true
  namespace            = "VE"

  data_json = <<EOT
{
  "policies": ["VE-policy-junior"],
  "password": "test"
}
EOT
}

# Enable the OIDC auth method.
resource "vault_jwt_auth_backend" "oidc" {
  description        = "Demonstration of the Terraform JWT auth backend"
  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = "https://login.microsoftonline.com/237fbc04-c52a-458b-af97-eaf7157c0cd4/v2.0"
  oidc_client_id     = "552c7f11-47fe-4557-bc7a-aead517d0e6e"
  oidc_client_secret = "TUh8Q~vVlG.xJ5PfpfInHpehPX0GVSsLUCzc-con"
  default_role       = "test-role"
}

# Create a role in the OIDC auth method.
resource "vault_jwt_auth_backend_role" "example" {
  backend        = vault_jwt_auth_backend.oidc.path
  role_name      = "test-role"
  token_policies = ["default"]

  user_claim   = "sub"
  groups_claim = "groups"
  role_type    = "oidc"
  allowed_redirect_uris = [
    "https://hcp-vault-cluster-public-vault-fea3e4a5.d6db98c2.z1.hashicorp.cloud:8200/ui/vault/auth/oidc/oidc/callback",
    "https://localhost:8250/oidc/callback"
  ]
}

# Create an external identity group named "external" with the "super-policy" policy.
resource "vault_identity_group" "admins" {
  name     = "external"
  type     = "external"
  policies = ["super-policy"]

  metadata = {
    version = "1"
  }
}

# Create an alias for the "external" group in the OIDC auth method.
resource "vault_identity_group_alias" "group-alias" {
  name           = "a3737b99-95f2-442f-94b9-0d2a3e144c67"
  mount_accessor = vault_jwt_auth_backend.oidc.accessor
  canonical_id   = vault_identity_group.admins.id
}