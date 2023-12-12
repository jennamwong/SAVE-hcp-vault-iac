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
resource "vault_policy" "user_policy_ve_academy" {
  name   = "users"
  namespace = vault_namespace.value-engineering.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_ve_CDL" {
  name   = "users"
  namespace = vault_namespace.value-engineering.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_ve_HVD" {
  name   = "users"
  namespace = vault_namespace.value-engineering.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea_se" {
  name   = "users"
  namespace = vault_namespace.SEA.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_sea_sa" {
  name   = "users"
  namespace = vault_namespace.SEA.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_cs_enterprise" {
  name   = "users"
  namespace = vault_namespace.customer-success.path_fq
  policy = file("policies/user-policy.hcl")
}

resource "vault_policy" "user_policy_cs_global" {
  name   = "users"
  namespace = vault_namespace.customer-success.path_fq
  policy = file("policies/user-policy.hcl")
}