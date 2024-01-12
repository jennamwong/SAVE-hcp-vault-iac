# ManageUsersPolicy.hcl
# This policy grants permissions to manage users in a child namespace
# Replace 'child-namespace' with your actual child namespace name
# Manage users in the 'userpass' auth method in a child namespace
path "child-namespace/auth/userpass/users/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Read and list users in the 'userpass' auth method in a child namespace
path "child-namespace/auth/userpass/users" {
  capabilities = ["read", "list"]
}
# Manage policies in a child namespace
path "child-namespace/sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Read and list policies in a child namespace
path "child-namespace/sys/policies/acl" {
  capabilities = ["read", "list"]
}
# Adjust and add more paths as necessary depending on the specific needs
# and the auth methods you use in your child namespaces.