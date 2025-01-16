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

variable "gcp_project_id" {
  description = "The id of the GCP project"
  type        = string
}

variable "gcp_cluster_name" {
  default     = "streamx"
  description = "The name of the kubernetes cluster."
  type        = string
}

variable "gcp_cluster_location" {
  default     = "europe-west3"
  description = "A valid GCP location (region or zone) in which the kubernetes cluster will be available."
  type        = string
}