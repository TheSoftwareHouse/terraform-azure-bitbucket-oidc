variable "display_name" {
  description = "Name for the Entra application"
  type        = string
}

variable "workspace" {
  description = "Bitbucket workspace name."
  type        = string
}

variable "repo" {
  description = "Bitbucket repository name."
  type        = string
}

variable "description" {
  description = "Description for the federated identity credential."
  type        = string
  default     = ""
}

variable "role_scope" {
  description = "ARM scope at which to assign the role (subscription, RG, etc.)."
  type        = string
}

variable "role_name" {
  description = "Built-in or custom Azure role to assign (e.g. 'Contributor')."
  type        = string
}
