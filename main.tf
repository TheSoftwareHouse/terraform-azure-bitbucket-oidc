data "azuread_client_config" "current" {}

resource "azuread_application" "bitbucket_oidc" {
  display_name = var.display_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_federated_identity_credential" "this" {
  application_id = azuread_application.bitbucket_oidc.id
  display_name   = var.display_name
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://api.bitbucket.org/2.0/workspaces/${var.workspace}/pipelines_config"
  subject        = "repo:${var.workspace}/${var.repo}:*"
  description    = var.description
}

data "azuread_service_principal" "sp" {
  client_id = azuread_application.bitbucket_oidc.client_id
}

resource "azurerm_role_assignment" "this" {
  scope                = var.role_scope
  role_definition_name = var.role_name
  principal_id         = data.azuread_service_principal.sp.object_id
}
