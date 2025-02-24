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

resource "kind_cluster" "cluster" {
  name            = "streamx"
  kubeconfig_path = "${path.module}/env/kubeconfig"
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    node {
      role = "control-plane"
      kubeadm_config_patches = [
        <<-KCP
        kind: InitConfiguration
        nodeRegistration:
          kubeletExtraArgs:
            node-labels: "ingress-ready=true"

        KCP
      ]

      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }

      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }
  }
}

module "streamx_platform" {
  source  = "streamx-dev/charts/helm"
  version = "0.0.3"

  ingress_controller_nginx_values = [
    file("${path.module}/config/ingress-controller-nginx/values.yaml")
  ]
  pulsar_kaap_values = [
    file("${path.module}/config/pulsar-kaap/values.yaml")
  ]
  cert_manager_lets_encrypt_issuer_acme_email          = var.cert_manager_lets_encrypt_issuer_acme_email
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
}
