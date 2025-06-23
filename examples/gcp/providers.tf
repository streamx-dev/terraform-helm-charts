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

data "google_client_config" "provider" {}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.cluster.endpoint}"
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}

provider "helm" {
  kubernetes = {
    host                   = "https://${google_container_cluster.cluster.endpoint}"
    token                  = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "gke-gcloud-auth-plugin"
    }
  }
}

provider "kubectl" {
  load_config_file       = false
  host                   = "https://${google_container_cluster.cluster.endpoint}"
  token                  = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}
