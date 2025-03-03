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

variable "azurerm_client_id" {
  description = "Azure app client id."
  type        = string
}

variable "azurerm_client_secret" {
  description = "Azure app client secret."
  type        = string
  sensitive   = true
}

variable "azurerm_tenant_id" {
  description = "Azure app tenant id."
  type        = string
}

variable "azurerm_subscription_id" {
  description = "Azure subscription id."
  type        = string
}

variable "cluster_name" {
  default     = "streamx-example"
  description = "Kubernetes cluster name."
  type        = string
}

variable "grafana_version" {
  default     = "10"
  description = "Grafana version."
  type        = string
}

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
