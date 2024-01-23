resource "vault_policy" "super-policy" {
     name   = "super-policy"
     policy = file("policies/super-policy.hcl")
 }

resource "vault_policy" "VE-admin" {
    name   = "generic-admin"
    namespace = "VE"
    policy = file("policies/generic-admin.hcl")
}

resource "vault_policy" "VE-senior" {
    name   = "VE-policy-senior"
    namespace = "VE"
    policy = file("policies/VE-policy-senior.hcl")
}

resource "vault_policy" "VE-junior" {
    name   = "VE-policy-junior"
    namespace = "VE"
    policy = file("policies/VE-policy-junior.hcl")
}

resource "vault_egp_policy" "preventkvv1" {
  name              = "prevent-kv-v1-engines"
  paths             = ["admin"]
  enforcement_level = "hard-mandatory"
  policy = file("policies/prevent-kv-v1-engines.sentinel")
}