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

resource "kubernetes_config_map_v1" "mimir-datasource" {
  metadata {
    name      = "mimir-datasource"
    namespace = var.grafana_namespace
    labels = {
      grafana_datasource = "1"
    }
  }

  data = {
    "prometheus-datasource.yaml" = <<EOT
apiVersion: 1
datasources:
  - name: "Mimir"
    uid: "mimir"
    type: "prometheus"
    access: "proxy"
    url: "http://mimir-nginx.${var.mimir_namespace}.svc.cluster.local:80/prometheus"
EOT
  }
}
