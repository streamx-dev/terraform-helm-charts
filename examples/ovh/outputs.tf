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
  value       = module.streamx_platform.loadbalancer_ip
}

output "cert_manager_lets_encrypt_issuer_ingress_annotations" {
  description = "Ingress annotations with Cert Manager Let's Encrypt issuer configuration"
  value       = module.streamx_platform.cert_manager_lets_encrypt_issuer_ingress_annotations
}

output "kubeconfig_path" {
  description = "K8s cluster kubeconfig file path"
  value       = abspath(local_sensitive_file.kubeconfig.filename)
}

output "kubeconfig" {
  description = "K8s cluster kubeconfig"
  value       = ovh_cloud_project_kube.cluster.kubeconfig
  sensitive   = true
}
