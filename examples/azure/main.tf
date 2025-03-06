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

resource "azurerm_resource_group" "example" {
  name     = "streamx-example"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "streamx-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "streax"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"

    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }

  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "bs" {
  name                  = "bs"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = "standard_b8ms"
  node_count            = 5
}


resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/env/kubeconfig"
  content  = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

module "streamx_platform" {
  source  = "streamx-dev/charts/helm"
  version = "0.0.4"

  cert_manager_lets_encrypt_issuer_acme_email = var.cert_manager_lets_encrypt_issuer_acme_email
  ingress_controller_nginx_settings = {
    "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path" : "/healthz"
    "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal" : false
  }
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
  streamx_operator_chart_repository_username           = "_json_key_base64"
  streamx_operator_chart_repository_password           = var.streamx_operator_image_pull_secret_registry_password

  depends_on = [
    azurerm_kubernetes_cluster_node_pool.bs,
  ]
}
