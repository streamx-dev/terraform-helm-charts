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

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
  }
}

provider "kubectl" {
  load_config_file       = false
  host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}

provider "azurerm" {
  client_id = var.azurerm_client_id
  client_secret = var.azurerm_client_secret
  tenant_id = var.azurerm_tenant_id
  subscription_id = var.azurerm_subscription_id
  resource_provider_registrations = "none"
  features {}
}

data "http" "api_key" {
  url = "https://login.microsoftonline.com/${var.azurerm_tenant_id}/oauth2/token"

  method = "POST"
  request_headers = {
    Content-Type = "application/x-www-form-urlencoded"
  }
  request_body = "grant_type=client_credentials&client_id=${var.azurerm_client_id}&client_secret=${var.azurerm_client_secret}&resource=ce34e7e5-485f-4d76-964f-b3d2b16d1e4f"
}

provider "grafana" {
  url = azurerm_dashboard_grafana.grafana.endpoint
  auth = jsondecode(data.http.api_key.response_body).access_token
}