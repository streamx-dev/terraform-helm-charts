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
  host                   = kind_cluster.cluster.endpoint
  client_certificate     = kind_cluster.cluster.client_certificate
  client_key             = kind_cluster.cluster.client_key
  cluster_ca_certificate = kind_cluster.cluster.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.cluster.endpoint
    client_certificate     = kind_cluster.cluster.client_certificate
    client_key             = kind_cluster.cluster.client_key
    cluster_ca_certificate = kind_cluster.cluster.cluster_ca_certificate
  }
}

provider "kubectl" {
  load_config_file       = false
  host                   = kind_cluster.cluster.endpoint
  client_certificate     = kind_cluster.cluster.client_certificate
  client_key             = kind_cluster.cluster.client_key
  cluster_ca_certificate = kind_cluster.cluster.cluster_ca_certificate
}
