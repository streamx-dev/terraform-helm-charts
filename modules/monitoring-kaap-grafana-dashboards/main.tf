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

locals {
  default_namespace = "prometheus-stack"

  namespace = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
}

resource "kubernetes_config_map_v1" "grafana_dashboard" {
  for_each = fileset("${path.module}/dashboards", "*.json")

  metadata {
    name      = "dashboard-${trimsuffix(each.key, ".json")}"
    namespace = local.namespace
    labels = {
      grafana_dashboard = "1"
    }
    annotations = {
      dashboard_folder = "KAAP"
    }
  }

  data = {
    (each.value) = file("${path.module}/dashboards/${each.value}")
  }
}
