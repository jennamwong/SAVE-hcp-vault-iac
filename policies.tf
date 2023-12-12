# Create admin policy in the admin namespace
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

#---------changes----------
resource "vault_policy" "user_policy_ve" {
  name   = "users"
  namespace = vault_namespace.value-engineering.academy.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_ve" {
  name   = "users"
  namespace = vault_namespace.value-engineering.CDL.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_ve" {
  name   = "users"
  namespace = vault_namespace.value-engineering.HVD.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea" {
  name   = "users"
  namespace = vault_namespace.SEA.SE.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea" {
  name   = "users"
  namespace = vault_namespace.SEA.SA.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea" {
  name   = "users"
  namespace = vault_namespace.customer-success.enterprise.path
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea" {
  name   = "users"
  namespace = vault_namespace.customer-success.global.path
  policy = file("policies/user-policy.hcl")
}