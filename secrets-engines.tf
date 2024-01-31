# Create a KV Version 2 secrets engine in the "VE/CDL" namespace.
# The full path of the namespace is required if it's a child namespace.
resource "vault_mount" "kvv2-example" {
  path      = "version2-example"
  namespace = "VE/CDL"
  type      = "kv-v2"
  options = {
    version = "2"
    type    = "kv-v2"
  }
  description = "This is an example KV Version 2 secret engine mount"
}

# Create a Transit secrets engine in the "VE" namespace.
# The full path of the namespace is not required if it's not a child namespace.
resource "vault_mount" "transit-example" {
  path        = "transit-example"
  namespace   = "VE"
  type        = "transit"
  description = "This is an example transit secret engine mount"

  options = {
    convergent_encryption = false
  }
}

# Create a PKI secrets engine in the default namespace (which is "admin" by default).
# If no namespace is specified, the secrets engine will be created in the default namespace.
resource "vault_mount" "pki-example" {
  path        = "pki-example"
  type        = "pki"
  description = "This is an example PKI mount"

  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}
