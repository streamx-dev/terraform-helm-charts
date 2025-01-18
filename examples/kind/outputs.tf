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

output "kubeconfig_path" {
  description = "K8s cluster kubeconfig file path"
  value       = abspath("${path.module}/env/kubeconfig")
}

output "kubeconfig" {
  description = "K8s cluster kubeconfig"
  value       = try(file(kind_cluster.cluster.kubeconfig_path), "File not yet created")
  sensitive   = true

  depends_on = [kind_cluster.cluster]
}
