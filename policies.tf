resource "vault_policy" "super-admin" {
     name   = "super-admin"
     policy = file("policies/super-admin.hcl")
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