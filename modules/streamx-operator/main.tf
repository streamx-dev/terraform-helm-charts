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
  default_atomic           = true
  default_chart_name       = "streamx-operator"
  default_chart_repository = "oci://europe-west1-docker.pkg.dev/streamx-releases/streamx-helm-charts"
  default_chart_version    = "0.0.2"
  default_cleanup_on_fail  = true
  default_create_namespace = true
  default_namespace        = "streamx-operator"
  default_release_name     = "streamx-operator"
  default_settings         = {}
  default_timeout          = 120
  default_values           = []

  atomic           = var.force_defaults_for_null_variables && var.atomic == null ? local.default_atomic : var.atomic
  chart_name       = var.force_defaults_for_null_variables && var.chart_name == null ? local.default_chart_name : var.chart_name
  chart_repository = var.force_defaults_for_null_variables && var.chart_repository == null ? local.default_chart_repository : var.chart_repository
  chart_version    = var.force_defaults_for_null_variables && var.chart_version == null ? local.default_chart_version : var.chart_version
  cleanup_on_fail  = var.force_defaults_for_null_variables && var.cleanup_on_fail == null ? local.default_cleanup_on_fail : var.cleanup_on_fail
  create_namespace = var.force_defaults_for_null_variables && var.create_namespace == null ? local.default_create_namespace : var.create_namespace
  namespace        = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
  release_name     = var.force_defaults_for_null_variables && var.release_name == null ? local.default_release_name : var.release_name
  settings         = var.force_defaults_for_null_variables && var.settings == null ? local.default_settings : var.settings
  timeout          = var.force_defaults_for_null_variables && var.timeout == null ? local.default_timeout : var.timeout
  values           = var.force_defaults_for_null_variables && var.values == null ? local.default_values : var.values
}

resource "helm_release" "streamx_operator" {
  atomic              = local.atomic
  chart               = local.chart_name
  cleanup_on_fail     = local.cleanup_on_fail
  create_namespace    = local.create_namespace
  name                = local.release_name
  namespace           = local.namespace
  repository          = local.chart_repository
  repository_username = var.chart_repository_username
  repository_password = var.chart_repository_password
  timeout             = local.timeout
  version             = local.chart_version
  values              = local.values

  dynamic "set" {
    for_each = local.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
