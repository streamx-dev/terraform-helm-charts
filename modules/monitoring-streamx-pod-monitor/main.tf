resource "kubectl_manifest" "streamx_pod_monitor" {
  yaml_body = file("${path.module}/config/streamx-pod-monitor.yaml")
  override_namespace = var.namespace
}