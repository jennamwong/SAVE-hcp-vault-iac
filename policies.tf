resource "vault_policy" "super_admin" {
     name   = "super_admin"
     policy = file("policies/super_admin.hcl")
 }

# resource "vault_policy" "veuser" {
#     name   = "VE-policy"
#     policy = file("policies/VE-policy.hcl")
# }