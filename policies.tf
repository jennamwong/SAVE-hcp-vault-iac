resource "vault_policy" "testadminpolicy" {
     name   = "testadminpolicy"
     policy = file("policies/testadminpolicy.hcl")
 }

# resource "vault_policy" "veuser" {
#     name   = "VE-policy"
#     policy = file("policies/VE-policy.hcl")
# }