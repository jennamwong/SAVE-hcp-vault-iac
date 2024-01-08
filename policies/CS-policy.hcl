# Low Level Policy
# Read operations on auth paths
path "CS/auth/*"
{
  capabilities = ["read"]
}

# No capabilities on sys/auth paths
path "CS/sys/auth/*"
{
  capabilities = []
}

# No capabilities on sys/auth path
path "CS/sys/auth"
{
  capabilities = []
}

# Read and list operations on sys/policies/acl paths
path "CS/sys/policies/acl/*"
{
  capabilities = ["read", "list"]
}

# List operation on sys/policies/acl path
path "CS/sys/policies/acl"
{
  capabilities = ["list"]
}

# Read operation on sys/mounts paths
path "CS/sys/mounts/*"
{
  capabilities = ["read"]
}

# Read operation on sys/mounts path
path "CS/sys/mounts"
{
  capabilities = ["read"]
}

# Read operation on secret paths
path "CS/secret/*"
{
  capabilities = ["read"]
}

# Read operation on transit paths
path "CS/transit/*"
{
  capabilities = ["read"]
}

# Read operation on sys/health path
path "CS/sys/health"
{
  capabilities = ["read"]
}
