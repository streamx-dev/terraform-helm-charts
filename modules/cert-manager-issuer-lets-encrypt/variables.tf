variable "force_defaults_for_null_variables" {
  default     = true
  description = "Enables forcing default variable values when the variable value passed to the module is null."
  type        = bool
}

variable "issuer_acme_email" {
  description = "Email passed to acme server."
  type        = string
}

variable "issuer_ingress_class" {
  default     = "nginx"
  description = "Cluster Issuer Ingress class name"
  type        = string
}

variable "name" {
  default     = "letsencrypt-cert-cluster-issuer"
  description = "Cluster Issuer name"
  type        = string
}

variable "namespace" {
  default     = "cert-manager"
  description = "K8s namespace in which Cert Manager Let's Encrypt cluster issuer is installed"
  type        = string
}

variable "prod_letsencrypt_server" {
  default     = false
  description = "Determines if created Cluster Issuer should use prod or staging acme server."
  type        = bool
}