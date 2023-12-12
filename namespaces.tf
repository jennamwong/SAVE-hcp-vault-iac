# Defines a Vault namespace for "value-engineering" with the path "value-engineering".
resource "vault_namespace" "value-engineering" {
  path = "value-engineering"
}

# Defines a Vault namespace for "SEA" with the path "SEA".
resource "vault_namespace" "SEA" {
  path = "SEA"
}

# Defines a Vault namespace for "customer-success" with the path "customer-success".
resource "vault_namespace" "customer-success" {
  path = "customer-success"
}

# Defines a Vault namespace for "academy" within the "value-engineering" namespace.
resource "vault_namespace" "academy" {
  namespace = vault_namespace.value-engineering.path
  path      = "academy"
}

# Defines a Vault namespace for "CDL" within the "value-engineering" namespace.
resource "vault_namespace" "CDL" {
  namespace = vault_namespace.value-engineering.path
  path      = "CDL"
}

# Defines a Vault namespace for "HVD" within the "value-engineering" namespace.
resource "vault_namespace" "HVD" {
  namespace = vault_namespace.value-engineering.path
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
resource "vault_namespace" "enterprise" {
  namespace = vault_namespace.customer-success.path
  path      = "enterprise"
}

# Defines a Vault namespace for "global" within the "customer-success" namespace.
resource "vault_namespace" "global" {
  namespace = vault_namespace.customer-success.path
  path      = "global"
}
