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
