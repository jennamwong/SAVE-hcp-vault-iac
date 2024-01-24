resource "vault_mount" "kvv2-example" {
  path        = vault_mount.VE.path
  namespace   = "CDL"
  type        = "kv-v2"
  options = {
    version = "2"
    type    = "kv-v2"
  }
  description = "This is an example KV Version 2 secret engine mount"
}

resource "vault_mount" "transit-example" {
  path        = "transit-example"
  namespace   = "VE"
  type        = "transit"
  description = "This is an example transit secret engine mount"

  options = {
    convergent_encryption = false
  }
}

resource "vault_mount" "pki-example" {
  path        = "pki-example"
  type        = "pki"
  description = "This is an example PKI mount"

  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 86400
}