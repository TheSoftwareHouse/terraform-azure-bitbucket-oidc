output "application_id" {
  description = "The AAD application (client) ID."
  value       = azuread_application.bitbucket_oidc.id
}

output "federated_credential_id" {
  description = "ID of the federated identity credential."
  value       = azuread_application_federated_identity_credential.this.id
}

output "service_principal_object_id" {
  description = "Object ID of the service principal for the app."
  value       = data.azuread_service_principal.sp.object_id
}
