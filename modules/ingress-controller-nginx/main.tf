locals {
  default_atomic           = true
  default_chart_name       = "ingress-nginx"
  default_chart_repository = "https://kubernetes.github.io/ingress-nginx"
  default_chart_version    = "4.10.1"
  default_cleanup_on_fail  = true
  default_create_namespace = true
  default_namespace        = "ingress-nginx"
  default_release_name     = "ingress-nginx"
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

resource "helm_release" "ingress_controller" {
  atomic           = local.atomic
  chart            = local.chart_name
  cleanup_on_fail  = local.cleanup_on_fail
  create_namespace = local.create_namespace
  name             = local.release_name
  namespace        = local.namespace
  repository       = local.chart_repository
  timeout          = local.timeout
  version          = local.chart_version
  values           = local.values

  dynamic "set" {
    for_each = local.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}

data "kubernetes_service" "ingress_svc" {
  metadata {
    name      = "ingress-nginx-controller"
    namespace = helm_release.ingress_controller.namespace
  }
  depends_on = [
    helm_release.ingress_controller
  ]
}