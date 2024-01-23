resource "vault_policy" "super-policy" {
     name   = "super-policy"
     policy = file("policies/super-policy.hcl")
 }

resource "vault_policy" "ve-senior" {
    name   = "ve-senior"
    namespace = "VE"
    policy = file("policies/VE-policy-senior.hcl")
}

resource "vault_policy" "ve-junior" {
    name   = "ve-junior"
    namespace = "VE"
    policy = file("policies/VE-policy-junior.hcl")
}