# Medium Level Policy
# Read and list operations on auth paths
path "auth/*"
{
  capabilities = ["read", "list"]
}

# Read operation on sys/auth paths
path "sys/auth/*"
{
  capabilities = ["read"]
}

# No capabilities on sys/auth path
path "sys/auth"
{
  capabilities = []
}

# Read and list operations on sys/policies/acl paths
path "sys/policies/acl/*"
{
  capabilities = ["read", "list"]
}

# List operation on sys/policies/acl path
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Read and list operations on sys/mounts paths
path "sys/mounts/*"
{
  capabilities = ["read", "list"]
}

# Read and list operations on sys/mounts path
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# Read and list operations on secret paths
path "secret/*"
{
  capabilities = ["read", "list"]
}

# Read and list operations on transit paths
path "transit/*"
{
  capabilities = ["read", "list"]
}

# Read operation on sys/health path
path "sys/health"
{
  capabilities = ["read"]
}

# Manage SEA Namespace Policy
path "sys/namespaces/SEA/*"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List SEA Namespace
path "sys/namespaces/SEA"
{
  capabilities = ["read", "list"]
}
