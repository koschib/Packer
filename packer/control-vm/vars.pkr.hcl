variable "client_id" {
  description = "The client ID of the application"
  type        = string
  default     = env("ARM_CLIENT_ID")
  sensitive   = true
}

variable "client_secret" {
  description = "The client secret of the application"
  type        = string
  default     = env("ARM_CLIENT_SECRET")
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID of the application"
  type        = string
  default     = env("ARM_TENANT_ID")
  sensitive   = true
}

variable "subscription_id" {
  description = "The subscription ID of the application"
  type        = string
  default     = env("ARM_SUBSCRIPTION_ID")
  sensitive   = true
}

