# Create a HashiCorp Virtual Network (HVN) in HCP
resource "hcp_hvn" "learn_hcp_vault_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

# Create a Vault cluster in HCP
resource "hcp_vault_cluster" "learn_hcp_vault" {
  hvn_id          = hcp_hvn.learn_hcp_vault_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = var.tier
  public_endpoint = true
}

# Create a VPC in AWS for peering
resource "aws_vpc" "peer" {
  cidr_block = "172.31.0.0/16"
}

# Get the ARN of the AWS VPC
data "aws_arn" "peer" {
  arn = aws_vpc.peer.arn
}

# Create a network peering connection between the HVN and the AWS VPC
resource "hcp_aws_network_peering" "peer" {
  hvn_id          = hcp_hvn.learn_hcp_vault_hvn.hvn_id
  peering_id      = var.peering_id
  peer_vpc_id     = aws_vpc.peer.id
  peer_account_id = aws_vpc.peer.owner_id
  peer_vpc_region = data.aws_arn.peer.region
}

# Create a route in the HVN for the network peering connection
resource "hcp_hvn_route" "peer_route" {
  hvn_link         = hcp_hvn.learn_hcp_vault_hvn.self_link
  hvn_route_id     = var.route_id
  destination_cidr = aws_vpc.peer.cidr_block
  target_link      = hcp_aws_network_peering.peer.self_link
}

# Accept the network peering connection in AWS
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
}

# Generate an admin token for the Vault cluster
resource "hcp_vault_cluster_admin_token" "learn_hcp_vault_token" {
  cluster_id = hcp_vault_cluster.learn_hcp_vault.cluster_id
}

# resource "vault_audit" "example" {
#   type  = "http"
#   path  = "example"
#   local = false

#   options = {
#     address = "https://webhook.site/2a11ee41-da3c-4ffe-b43c-78e9b515d288"
#   }
# }

# resource "vault_audit" "file_audit" {
#   type = "file"

#   options = {
#     file_path = "/Users/syedquadri/Desktop/SAVE-hcp-vault-iac/audit.txt"
#   }
# }

resource "vault_audit" "socket_audit" {
  type = "socket"

  options = {
    address     = "127.0.0.1:9090"
    socket_type = "tcp"
  }
}