# Create admin policy in the root namespace
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "admin_policy_ve" {
  name   = "admins"
  namespace = vault_namespace.value-engineering.path
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "admin_policy_sea" {
  name   = "admins"
  namespace = vault_namespace.SEA.path
  policy = file("policies/admin-policy.hcl")
}

resource "vault_policy" "admin_policy_cs" {
  name   = "admins"
  namespace = vault_namespace.customer-success.path
  policy = file("policies/admin-policy.hcl")
}

