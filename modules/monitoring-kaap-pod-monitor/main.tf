locals {
  default_namespace        = "kaap"

  namespace        = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
}

resource "kubectl_manifest" "kaap_bookkeeper_pod_monitor" {
  yaml_body = file("${path.module}/config/kaap-bookkeeper-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_broker_pod_monitor" {
  yaml_body = file("${path.module}/config/kaap-broker-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_zookeeper_pod_monitor" {
  yaml_body = file("${path.module}/config/kaap-zookeeper-pod-monitor.yaml")
  override_namespace = local.namespace
}

resource "kubectl_manifest" "kaap_operator_pod_monitor" {
  yaml_body = file("${path.module}/config/kaap-operator-pod-monitor.yaml")
  override_namespace = local.namespace
}