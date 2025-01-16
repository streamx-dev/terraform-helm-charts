### Enable/Disable sub-modules
variable "ingress_controller_nginx_enabled" {
  default     = true
  description = "Enables NGINX Ingress Controller."
  type        = bool
}

variable "cert_manager_enabled" {
  default     = true
  description = "Enables Cert Manager."
  type        = bool
}

variable "cert_manager_lets_encrypt_issuer_enabled" {
  default     = true
  description = "Enables Cert Manager Let's Encrypt Issuer."
  type        = bool
}

variable "pulsar_kaap_enabled" {
  default     = true
  description = "Enables Kubernetes Autoscaling for Apache Pulsar (KAAP)."
  type        = bool
}

variable "streamx_operator_enabled" {
  default     = true
  description = "Enables StreamX Operator."
  type        = bool
}

variable "streamx_operator_image_pull_secret_enabled" {
  default     = true
  description = "Enables StreamX Operator Image Pull Secret."
  type        = bool
}

### Sub-module Variables

#######
### Namespace Management
#######

### NGINX Ingress Controller
variable "ingress_controller_nginx_create_namespace" {
  default     = null
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "ingress_controller_nginx_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### Cert Manager
variable "cert_manager_create_namespace" {
  default     = null
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "cert_manager_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### Cert Manager Let's Encrypt Issuer

variable "cert_manager_lets_encrypt_issuer_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### KAAP
variable "pulsar_kaap_create_namespace" {
  default     = null
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "pulsar_kaap_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### StreamX Operator
variable "streamx_operator_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "streamx_operator_namespace" {
  default     = "streamx-operator"
  description = "The namespace used for the deployment"
  type        = string
}

###########################
### Sub-module Variables
### Most variables inherit the default values from their submodule, hence the use of `null` defaults
###########################

#######
### NGINX Ingress Controller
#######
variable "ingress_controller_nginx_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "ingress_controller_nginx_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "ingress_controller_nginx_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "ingress_controller_nginx_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "ingress_controller_nginx_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "ingress_controller_nginx_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "ingress_controller_nginx_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type = list(string)
}

#######
### Cert manager
#######
variable "cert_manager_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "cert_manager_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "cert_manager_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "cert_manager_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "cert_manager_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "cert_manager_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "cert_manager_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type = list(string)
}

#######
### Cert Manager Let's Encrypt Issuer
#######

variable "cert_manager_lets_encrypt_issuer_name" {
  description = "Cluster Issuer name"
  type        = string
  default     = null
}

variable "cert_manager_lets_encrypt_issuer_prod_letsencrypt_server" {
  description = "Determines if created Cluster Issuer should use prod or staging acme server."
  type        = bool
  default     = null
}

variable "cert_manager_lets_encrypt_issuer_acme_email" {
  description = "Email passed to acme server."
  type        = string
}

variable "cert_manager_lets_encrypt_issuer_ingress_class" {
  description = "Cluster Issuer Ingress class name"
  type        = string
  default     = null
}

#######
### KAAP
#######
variable "pulsar_kaap_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "pulsar_kaap_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "pulsar_kaap_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "pulsar_kaap_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "pulsar_kaap_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "pulsar_kaap_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "pulsar_kaap_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type = list(string)
}

#######
### StreamX Operator
#######
variable "streamx_operator_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "streamx_operator_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "streamx_operator_chart_repository_username" {
  default     = null
  description = "The username used for the repository authentication."
  type        = string
}

variable "streamx_operator_chart_repository_password" {
  default     = null
  description = "The password used for the repository authentication."
  type        = string
  sensitive   = true
}

variable "streamx_operator_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "streamx_operator_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "streamx_operator_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "streamx_operator_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation."
  type        = number
}

variable "streamx_operator_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default composed values. Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type = list(string)
}

variable "streamx_operator_messaging_pulsar_init_image" {
  default     = "ghcr.io/streamx-dev/streamx/pulsar-init:latest-jvm"
  description = "Pulsar Tenant Init container image."
  type        = string
}

variable "streamx_operator_messaging_pulsar_client_service_url" {
  default     = null
  description = "Pulsar client service URL passed to StreamX Operator if KAAP is disabled."
  type        = string
}

variable "streamx_operator_messaging_pulsar_admin_service_url" {
  default     = null
  description = "Pulsar admin service URL passed to StreamX Operator if KAAP is disabled."
  type        = string
}

variable "streamx_operator_monitoring_traces_enabled" {
  default     = false
  description = "Enables traces monitoring for StreamX Meshes deployed by StreamX Operator"
  type        = bool
}

variable "streamx_operator_monitoring_traces_endpoint" {
  default     = null
  description = "Traces collector URL"
  type        = string
}

#######
### StreamX Operator image pull secret
#######
variable "streamx_operator_image_pull_secret_name" {
  default     = "sx-operator-image-pull-secret"
  description = "StreamX Operator image pull secret name."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_server" {
  default     = "europe-west1-docker.pkg.dev"
  description = "StreamX Operator container image registry server."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_email" {
  description = "StreamX Operator container image registry user email."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_username" {
  default     = "_json_key_base64"
  description = "StreamX Operator container image registry username."
  type        = string
}

variable "streamx_operator_image_pull_secret_registry_password" {
  description = "StreamX Operator container image registry user password."
  type        = string
  sensitive   = true
}