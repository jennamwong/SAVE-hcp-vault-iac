# Low Level Policy
# Read operations on auth paths
path "auth/*"
{
  capabilities = ["read"]
}

# No capabilities on sys/auth paths
path "sys/auth/*"
{
  capabilities = []
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

# Read operation on sys/mounts paths
path "sys/mounts/*"
{
  capabilities = ["read"]
}

# Read operation on sys/mounts path
path "sys/mounts"
{
  capabilities = ["read"]
}

# Read operation on secret paths
path "secret/*"
{
  capabilities = ["read"]
}

# Read operation on transit paths
path "transit/*"
{
  capabilities = ["read"]
}

# Read operation on sys/health path
path "sys/health"
{
  capabilities = ["read"]
}
