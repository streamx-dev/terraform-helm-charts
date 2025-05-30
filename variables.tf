# Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

### Enable/Disable sub-modules
variable "ingress_controller_apisix_enabled" {
  default     = true
  description = "Enables APISIX Ingress Controller."
  type        = bool
}

variable "ingress_controller_nginx_enabled" {
  default     = false
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

variable "prometheus_stack_enabled" {
  default     = true
  description = "Enables Kubernetes Prometheus Stack."
  type        = bool
}

variable "minio_enabled" {
  default     = true
  description = "Enables MinIO."
  type        = bool
}

variable "loki_enabled" {
  default     = true
  description = "Enables Loki."
  type        = bool
}

variable "tempo_enabled" {
  default     = true
  description = "Enables Tempo."
  type        = bool
}

variable "opentelemetry_operator_enabled" {
  default     = true
  description = "Enables OpenTelemetry Operator."
  type        = bool
}

variable "opentelemetry_collector_deamonset_enabled" {
  default     = true
  description = "Enables OpenTelemetry Collector Deamonset."
  type        = bool
}

variable "opentelemetry_collector_statefulset_enabled" {
  default     = false
  description = "Enables OpenTelemetry Collector Statefulset."
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

### APISIX Ingress Controller
variable "ingress_controller_apisix_create_namespace" {
  default     = null
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "ingress_controller_apisix_namespace" {
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

### Prometheus stack
variable "prometheus_stack_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "prometheus_stack_namespace" {
  default     = "prometheus-stack"
  description = "The namespace used for the deployment"
  type        = string
}

### MinIO
variable "minio_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "minio_namespace" {
  default     = "minio"
  description = "The namespace used for the deployment"
  type        = string
}

### Loki
variable "loki_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "loki_namespace" {
  default     = "loki"
  description = "The namespace used for the deployment"
  type        = string
}

### Tempo
variable "tempo_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "tempo_namespace" {
  default     = "tempo"
  description = "The namespace used for the deployment"
  type        = string
}

### OpenTelemetry Operator
variable "opentelemetry_operator_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "opentelemetry_operator_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### OpenTelemetry Collector Deamonset
variable "opentelemetry_collector_deamonset_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "opentelemetry_collector_deamonset_namespace" {
  default     = null
  description = "The namespace used for the deployment"
  type        = string
}

### OpenTelemetry Collector Statefulset
variable "opentelemetry_collector_statefulset_create_namespace" {
  default     = true
  description = "Create a namespace for the deployment."
  type        = bool
}

variable "opentelemetry_collector_statefulset_namespace" {
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
### APISIX Ingress Controller
#######
variable "ingress_controller_apisix_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "ingress_controller_apisix_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "ingress_controller_apisix_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "ingress_controller_apisix_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "ingress_controller_apisix_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "ingress_controller_apisix_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "ingress_controller_apisix_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

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
  type        = list(string)
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
  type        = list(string)
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
### MinIO
#######
variable "minio_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "minio_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "minio_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "minio_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "minio_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "minio_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "minio_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

#######
### Loki
#######
variable "loki_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "loki_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "loki_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "loki_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "loki_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "loki_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "loki_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

#######
### Tempo
#######
variable "tempo_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "tempo_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "tempo_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "tempo_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "tempo_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "tempo_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "tempo_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

#######
### OpenTelemetry Operator
#######
variable "opentelemetry_operator_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "opentelemetry_operator_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "opentelemetry_operator_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "opentelemetry_operator_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "opentelemetry_operator_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "opentelemetry_operator_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "opentelemetry_operator_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

#######
### OpenTelemetry Collector Deamonset
#######
variable "opentelemetry_collector_deamonset_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "opentelemetry_collector_deamonset_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "opentelemetry_collector_deamonset_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "opentelemetry_collector_deamonset_release_name" {
  default     = "collector-deamonset"
  description = "The name of the helm release."
  type        = string
}

variable "opentelemetry_collector_deamonset_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "opentelemetry_collector_deamonset_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "opentelemetry_collector_deamonset_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

variable "opentelemetry_collector_deamonset_logs_otlphttp_endpoint" {
  default     = null
  description = "Logs OTLP HTTP endpoint."
  type        = string
}

variable "opentelemetry_collector_deamonset_traces_otlp_endpoint" {
  default     = null
  description = "Traces OTLP endpoint."
  type        = string
}

variable "opentelemetry_collector_deamonset_metrics_otlphttp_endpoint" {
  default     = null
  description = "Metrics OTLP HTTP endpoint."
  type        = string
}

#######
### OpenTelemetry Collector Statefulset
#######
variable "opentelemetry_collector_statefulset_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "opentelemetry_collector_statefulset_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "opentelemetry_collector_statefulset_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "opentelemetry_collector_statefulset_release_name" {
  default     = "collector-statefulset"
  description = "The name of the helm release."
  type        = string
}

variable "opentelemetry_collector_statefulset_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "opentelemetry_collector_statefulset_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "opentelemetry_collector_statefulset_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

#######
### Prometheus stack
#######
variable "prometheus_stack_chart_name" {
  default     = null
  description = "The name of the Helm chart to install"
  type        = string
}

variable "prometheus_stack_chart_repository" {
  default     = null
  description = "The repository containing the Helm chart to install."
  type        = string
}

variable "prometheus_stack_chart_version" {
  default     = null
  description = "The version of the Helm chart to install."
  type        = string
}

variable "prometheus_stack_release_name" {
  default     = null
  description = "The name of the helm release."
  type        = string
}

variable "prometheus_stack_settings" {
  default     = null
  description = "Additional key value settings which will be passed to the Helm chart values, e.g. { \"namespace\" = \"kube-system\" }."
  type        = map(any)
}

variable "prometheus_stack_timeout" {
  default     = null
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
}

variable "prometheus_stack_values" {
  default     = null
  description = "A list of values in raw YAML to be applied to the helm release. Overrides default values from [default-configs](./default-configs). Merges with the settings input, can also be used with the `file()` function, i.e. `file(\"my/values.yaml\")`."
  type        = list(string)
}

variable "prometheus_stack_grafana_admin_login" {
  default     = "sxadmin"
  description = "Grafana admin user login"
  type        = string
}

variable "prometheus_stack_grafana_admin_password" {
  default     = "sxadmin"
  description = "Grafana admin user password"
  type        = string
  sensitive   = true
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
  type        = list(string)
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
  type        = list(string)
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

variable "streamx_operator_monitoring_traces_mode" {
  default     = null
  description = "Traces monitoring mode for StreamX Meshes deployed by StreamX Operator"
  type        = string
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
