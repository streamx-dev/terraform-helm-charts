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
      dashboard_folder = "Loki"
    }
  }

  data = {
    (each.value) = file("${path.module}/dashboards/${each.value}")
  }
}