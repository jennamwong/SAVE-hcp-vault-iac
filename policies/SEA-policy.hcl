# Medium Level Policy
# Read and list operations on auth paths
path "SEA/auth/*"
{
  capabilities = ["read", "list"]
}

# Read operation on sys/auth paths
path "SEA/sys/auth/*"
{
  capabilities = ["read"]
}

# No capabilities on sys/auth path
path "SEA/sys/auth"
{
  capabilities = []
}

# Read and list operations on sys/policies/acl paths
path "SEA/sys/policies/acl/*"
{
  capabilities = ["read", "list"]
}

# List operation on sys/policies/acl path
path "SEA/sys/policies/acl"
{
  capabilities = ["list"]
}

# Read and list operations on sys/mounts paths
path "SEA/sys/mounts/*"
{
  capabilities = ["read", "list"]
}

# Read and list operations on sys/mounts path
path "SEA/sys/mounts"
{
  capabilities = ["read", "list"]
}

# Read and list operations on secret paths
path "SEA/secret/*"
{
  capabilities = ["read", "list"]
}

# Read and list operations on transit paths
path "SEA/transit/*"
{
  capabilities = ["read", "list"]
}

# Read operation on sys/health path
path "SEA/sys/health"
{
  capabilities = ["read"]
}
