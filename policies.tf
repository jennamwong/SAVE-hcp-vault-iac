resource "vault_policy" "super-policy" {
     name   = "super-policy"
     policy = file("policies/super-policy.hcl")
 }

resource "vault_policy" "VE-admin" {
    name   = "ve-admin"
    namespace = "VE"
    policy = file("policies/VE-admin.hcl")
}

resource "vault_policy" "VE-senior" {
    name   = "ve-senior"
    namespace = "VE"
    policy = file("policies/VE-policy-senior.hcl")
}

resource "vault_policy" "VE-junior" {
    name   = "ve-junior"
    namespace = "VE"
    policy = file("policies/VE-policy-junior.hcl")
}

resource "vault_egp_policy" "preventkvv1" {
  name              = "prevent-kv-v1-engines"
  paths             = ["admin"]
  enforcement_level = "hard-mandatory"

  policy = "prevent-kv-v1-engines" 
}