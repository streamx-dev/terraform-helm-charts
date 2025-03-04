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

variable "grafana_admin_password" {
  description = "Grafana admin user password."
  type        = string
  sensitive   = true
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
