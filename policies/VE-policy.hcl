# High Level Policy
# Manage auth methods broadly across Vault
path "VE/auth/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Create, update, and delete auth methods
path "VE/sys/auth/*"
{
  capabilities = ["create", "update"]
}

# List auth methods
path "VE/sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "VE/sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# List ACL policies
path "VE/sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "VE/sys/mounts/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# List enabled secrets engines
path "VE/sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at secret/
path "VE/secret/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Manage transit secrets engine
path "VE/transit/*"
{
  capabilities = ["create", "read", "update", "list"]
}

# Read health checks
path "VE/sys/health"
{
  capabilities = ["read"]
}
