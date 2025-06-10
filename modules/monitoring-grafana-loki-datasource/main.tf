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

resource "kubernetes_config_map_v1" "loki-datasource" {
  metadata {
    name      = "loki-datasource"
    namespace = var.grafana_namespace
    labels = {
      grafana_datasource = "1"
    }
  }

  data = {
    "loki-datasource.yaml" = <<EOT
apiVersion: 1
datasources:
  - name: "Loki"
    type: "loki"
    uid: "loki"
    access: "proxy"
    url: "http://loki-read-headless.${var.loki_namespace}.svc.cluster.local:3100"
    jsonData:
      timeout: 120
      maxLines: 1000
EOT
  }
}
