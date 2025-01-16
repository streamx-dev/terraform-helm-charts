variable "force_defaults_for_null_variables" {
  default     = true
  description = "Enables forcing default variable values when the variable value passed to the module is null."
  type        = bool
}

variable "namespace" {
  default     = "cert-manager"
  description = "The namespace used for the deployment"
  type        = string
}