# Infrastructure as Code with TF and HCP Vault

The goal of this project was to employ Terraform to set up a production-ready Vault cluster. This configuration includes policies, secrets engines, and authentication methods for both users and machines. Additionally, the setup incorporates audit logging and metrics, utilizing Grafana Cloud and a generic HTTP sink for monitoring and logging purposes.

## Doormat Setup

- We have compiled, signed release binaries available on GitHub Releases. Go to the [latest release](https://github.com/hashicorp/doormat-cli/releases/tag/v4.2.0) and download the .tar.gz file as appropriate.
- For recent macOS machines, you probably want the file ending in \_darwin_arm64.tar.gz.
- Assuming the .tar.gz was downloaded to your Downloads folder, you can run the following commands in your Terminal, updating the VERSION= line to match the version of doormat-cli you downloaded:

```
VERSION=4.1.0 # Update to the the version you downloaded

mkdir -p ${HOME}/.local/bin
echo ${PATH} | grep -q "${HOME}/.local/bin" \
    || echo 'export PATH="${HOME}/.local/bin${PATH+:${PATH}}"' \
    >> ${HOME}/.zprofile
UNAME_S="$(uname -s | tr '[:upper:]' '[:lower:]')"
UNAME_M="$(uname -m)"
tar -C ${HOME}/.local/bin -xzf \
    ${HOME}/Downloads/doormat-cli_${VERSION}_${UNAME_S}_${UNAME_M}.tar.gz \
    doormat
chmod +x ${HOME}/.local/bin/doormat

doormat --version
```

- If you're on macOS and get a system warning about an untrusted binary, please run the following:

`spctl --add ${HOME}/.local/bin/doormat`

- Follow steps 2-7 onwards [here](https://docs.google.com/document/d/1inYfZiAn43TlfFR2JVmYGFscywyFUThTWcXBNmy-A6g/edit)

## Logs and Metrics

1. HTTP Sink
   1. Open this [link](https://webhook.site/)
   2. Replace `http_uri` within the `hcp_vault_cluster` resource in `vault.tf` with your unique URL
      ![Getting Started](images/URL.png)
2. Grafana Cloud
   1. Create a [Grafana cloud account](https://grafana.com/auth/sign-up/create-user?pg=hp&plcmt=hero-btn1&cta=create-free-account)
   2. In the left navigation go to add new connection and search HCP Vault
   3. Click `Metrics` near the top
      ![Getting Started](images/metrics.png)
   4. Navigate to the `variables.tf` file
   5. Replace the default values of `grafana_endpoint_metrics`, `grafana_user_metrics`, and `grafana_password` with your unique values
   6. Click `Logs` near the top
      ![Getting Started](images/logs.png)
   7. Replace `grafana_endpoint_logs` and `grafana_user_logs` with your unique values. The password will remain the same
3. This should auto create a dashboard for you but it doesnt
   1. Navigate to dashboards
   2. Click new and import
   3. Enter `12904` for the ID and Load
   4. Set the Promxy to default and Import

## Azure Setup

### Requesting AD Access

1. Request access for `Azure Entra ID in HashiCorp02` [here](https://doormat.hashicorp.services/applications/access/az-ad-hashicorp02/role/doormat-azure-ad-hashicorp02-developer-access/options) - more documentation on this can be found [here](https://docs.prod.secops.hashicorp.services/doormat/azure/working_with_ad/)
2. You should have access in a few min - navigate to doormat and click console for your new account

### Inside Azure

1. Search `App registrations`
2. Click New registration
3. Under supported account types select the single tenant option
4. Click register
5. Save `application client ID` for later. This will be your `oidc_client_id`
6. Under the manage section on the left
   1. Click `Authentication`
   2. Add `https://localhost:8250/oidc/callback` to redirect URL
   3. Copy Vault Cluster public url and modify to look like below and add as redirect url
   ```
   https://hcp-vault-cluster-public-vault-fea3e4a5.d6db98c2.z1.hashicorp.cloud:8200/ui/vault/auth/oidc/oidc/callback
   ```
   4. Click `Certificates & secrets`
   5. Click `New client secret`
   6. Click `Add`
   7. Save the `Value` for later. This will be your `oidc_client_secret`
7. Click Token Configuration
   1. Click `add groups claim`
   2. Check `Security groups`
   3. Click `save`
8. Click `Groups`
   1. Click `new group` and give it a name
   2. Save the `Object ID` for later. This will be your `name` in `vault_identity_group_alias` resource group

### Code editor

1. Navigate to auth.tf
2. Within the `vault_jwt_auth_backend` resource block
   - Replace `oidc_client_id` with yours
   - Replace `oidc_client_secret` with yours
3. Within the `vault_jwt_auth_backend_role` resource block replace the URLs with the ones you saved earlier. (Second one will stay the same)
4. Within the `vault_identity_group_alias` resource block replace `name` with yours

## HCP Vault UI

1. Change login method to `OIDC`
2. Click `Sign in with OIDC provider`
