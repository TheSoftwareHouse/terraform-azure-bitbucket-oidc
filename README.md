# Azure BitBucket OIDC

## Usage

```hcl
module "bitbucket_oidc" {
  source       = "git@github.com:TheSoftwareHouse/terraform-azure-bitbucket-oidc.git?ref=v1.0.0"

  display_name = "bitbucket-oidc-app"
  workspace    = "my-workspace"
  repo         = "my-repo"
  description  = "OIDC for Bitbucket CI"

  role_scope   = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_name    = "Contributor"
}
```

## Inputs

| Name           | Type   | Default | Description                                                                                   |
|----------------|--------|---------|-----------------------------------------------------------------------------------------------|
| display_name   | string | —       | Name for the AAD Application and its credential.                                |
| workspace      | string | —       | Bitbucket workspace name.                                                              |
| repo           | string | —       | Bitbucket repository name.                                                                    |
| description    | string | `""`    | Description for the federated identity credential.                                            |
| role_scope     | string | —       | ARM scope at which to assign the role (subscription ID, resource group, etc.).                |
| role_name      | string | —       | Azure role to assign (e.g. `"Reader"`, `"Contributor"`, etc.).                                |

## Outputs

| Name                         | Description                                           | Value                                                                          |
|------------------------------|-------------------------------------------------------|--------------------------------------------------------------------------------|
| application_id               | The AAD Application (client) ID.                      | `azuread_application.bitbucket_oidc.application_id`                            |
| federated_credential_id      | ID of the federated identity credential.              | `azuread_application_federated_identity_credential.this.id`                    |
| service_principal_object_id  | Object ID of the created Service Principal.           | `data.azuread_service_principal.sp.object_id`                                  |
