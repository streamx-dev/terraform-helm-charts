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

variable "name" {
  description = "Secret name"
  type        = string
}

variable "namespace" {
  description = "Namespace in which secret is created"
  type        = string
}

variable "registry_server" {
  description = "Docker registry server URL"
  type        = string
}

variable "registry_username" {
  description = "Docker registry user name"
  type        = string
}

variable "registry_password" {
  description = "Docker registry user password"
  type        = string
  sensitive   = true
}

variable "registry_email" {
  description = "Docker registry user email"
  type        = string
}
