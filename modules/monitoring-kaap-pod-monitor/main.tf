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
  default_namespace = "kaap"

  namespace = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
}

resource "kubectl_manifest" "kaap_bookkeeper_pod_monitor" {
  yaml_body          = file("${path.module}/config/kaap-bookkeeper-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_broker_pod_monitor" {
  yaml_body          = file("${path.module}/config/kaap-broker-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_proxy_pod_monitor" {
  yaml_body          = file("${path.module}/config/kaap-proxy-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_zookeeper_pod_monitor" {
  yaml_body          = file("${path.module}/config/kaap-zookeeper-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_operator_pod_monitor" {
  yaml_body          = file("${path.module}/config/kaap-operator-pod-monitor.yaml")
  override_namespace = local.namespace
}
