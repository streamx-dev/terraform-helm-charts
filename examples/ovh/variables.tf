variable "cert_manager_lets_encrypt_issuer_acme_email" {
  description = "Email passed to acme server."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_email" {
  description = "StreamX Operator container image registry user email."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_password" {
  description = "StreamX Operator container image registry user password."
  type        = string
  sensitive   = true
}

variable "ovh_service_name" {
  description = "The id of the public OVH cloud project"
  type        = string
}

variable "ovh_cluster_name" {
  default     = "streamx"
  description = "The name of the kubernetes cluster."
  type        = string
}

variable "ovh_cluster_region" {
  default     = "GRA11"
  description = "A valid OVHcloud public cloud region ID in which the kubernetes cluster will be available."
  type        = string
}