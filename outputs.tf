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

output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = length(module.ingress_controller_nginx) > 0 ? module.ingress_controller_nginx.0.ingress_ip : null
}

output "cert_manager_lets_encrypt_issuer_ingress_annotations" {
  description = "Ingress annotations with Cert Manager Let's Encrypt issuer configuration"
  value       = length(module.cert_manager_lets_encrypt_issuer) > 0 ? module.cert_manager_lets_encrypt_issuer.0.cluster_issuer_ingress_annotations : null
}
