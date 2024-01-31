# Create a Vault policy named "super-policy" using the HCL file at "policies/super-policy.hcl".
resource "vault_policy" "super-policy" {
  name   = "super-policy"
  policy = file("policies/super-policy.hcl")
}

# Create a Vault policy named "generic-admin" in the "VE" namespace using the HCL file at "policies/generic-admin.hcl".
resource "vault_policy" "VE-admin" {
  name      = "generic-admin"
  namespace = "VE"
  policy    = file("policies/generic-admin.hcl")
}

# Create a Vault policy named "VE-policy-senior" in the "VE" namespace using the HCL file at "policies/VE-policy-senior.hcl".
resource "vault_policy" "VE-senior" {
  name      = "VE-policy-senior"
  namespace = "VE"
  policy    = file("policies/VE-policy-senior.hcl")
}

# Create a Vault policy named "VE-policy-junior" in the "VE" namespace using the HCL file at "policies/VE-policy-junior.hcl".
resource "vault_policy" "VE-junior" {
  name      = "VE-policy-junior"
  namespace = "VE"
  policy    = file("policies/VE-policy-junior.hcl")
}

# Create an Endpoint Governing Policy (EGP) that prevents the creation of KV Version 1 secrets engines in the "admin" namespace.
# This policy uses the Sentinel policy file at "policies/prevent-kv-v1-engines.sentinel".
# Note: This will only work in a plus tier cluster. 
# resource "vault_egp_policy" "preventkvv1" {
#   name              = "prevent-kv-v1-engines"
#   paths             = ["admin"]
#   enforcement_level = "hard-mandatory"
#   policy = file("policies/prevent-kv-v1-engines.sentinel")
# }
