# Defines a Vault namespace for "value-engineering" with the path "value-engineering".
resource "vault_namespace" "VE" {
  path = "VE"
}

# Defines a Vault namespace for "SEA" with the path "SEA".
resource "vault_namespace" "SEA" {
  path = "SEA"
}

# Defines a Vault namespace for "customer-success" with the path "customer-success".
resource "vault_namespace" "CS" {
  path = "CS"
}

# Defines a Vault namespace for "academy" within the "value-engineering" namespace.
resource "vault_namespace" "ACA" {
  namespace = vault_namespace.VE.path
  path      = "ACA"
}

# Defines a Vault namespace for "CDL" within the "value-engineering" namespace.
resource "vault_namespace" "CDL" {
  namespace = vault_namespace.VE.path
  path      = "CDL"
}

# Defines a Vault namespace for "HVD" within the "value-engineering" namespace.
resource "vault_namespace" "HVD" {
  namespace = vault_namespace.VE.path
  path      = "HVD"
}

# Defines a Vault namespace for "SE" within the "SEA" namespace.
resource "vault_namespace" "SE" {
  namespace = vault_namespace.SEA.path
  path      = "SE"
}

# Defines a Vault namespace for "SA" within the "SEA" namespace.
resource "vault_namespace" "SA" {
  namespace = vault_namespace.SEA.path
  path      = "SA"
}

# Defines a Vault namespace for "enterprise" within the "customer-success" namespace.
resource "vault_namespace" "ENT" {
  namespace = vault_namespace.CS.path
  path      = "ENT"
}

# Defines a Vault namespace for "global" within the "customer-success" namespace.
resource "vault_namespace" "GLO" {
  namespace = vault_namespace.CS.path
  path      = "GLO"
}
