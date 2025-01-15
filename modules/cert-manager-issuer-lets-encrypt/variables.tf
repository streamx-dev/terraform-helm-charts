variable "name" {
  description = "Cluster Issuer name"
  type        = string
  default     = null
}

variable "namespace" {
  description = "K8s namespace in which Cert Manager Let's Encrypt cluster issuer is installed"
  type        = string
  default     = null
}

variable "prod_letsencrypt_server" {
  description = "Determines if created Cluster Issuer should use prod or staging acme server."
  type        = bool
  default     = null
}

variable "issuer_acme_email" {
  description = "Email passed to acme server."
  type        = string
}

variable "issuer_ingress_class" {
  description = "Cluster Issuer Ingress class name"
  type        = string
  default     = null
}