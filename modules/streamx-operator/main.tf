locals {
  atomic           = var.atomic != null ? var.atomic : true
  chart_name       = var.chart_name != null ? var.chart_name : "streamx-operator"
  chart_repository = var.chart_repository != null ? var.chart_repository : "oci://europe-west1-docker.pkg.dev/streamx-releases/streamx-helm-charts"
  chart_version    = var.chart_version != null ? var.chart_version : "0.0.2"
  cleanup_on_fail  = var.cleanup_on_fail != null ? var.cleanup_on_fail : true

  create_namespace = var.create_namespace != null ? var.create_namespace : true
  namespace        = var.namespace != null ? var.namespace : "streamx-operator"
  release_name     = var.release_name != null ? var.release_name : "streamx-operator"
  settings         = var.settings != null ? var.settings : {}
  timeout          = var.timeout != null ? var.timeout : 120
  values           = var.values != null ? var.values : []
}

resource "helm_release" "cert_manager" {
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