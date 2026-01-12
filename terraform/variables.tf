variable "vault_token" {
  description = "Root token for Vault server"
  type        = string
  sensitive   = true
}

variable "deployment_mode" {
  description = "Deployment type for the Vault app (e.g. dev, or custom arguments)"
  type        = string
  default     = "dev"
}
