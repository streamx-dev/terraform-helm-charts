locals {
  atomic           = var.atomic != null ? var.atomic : true
  chart_name       = var.chart_name != null ? var.chart_name : "ingress-nginx"
  chart_repository = var.chart_repository != null ? var.chart_repository : "https://kubernetes.github.io/ingress-nginx"
  chart_version    = var.chart_version != null ? var.chart_version : "4.10.1"
  cleanup_on_fail  = var.cleanup_on_fail != null ? var.cleanup_on_fail : true

  create_namespace = var.create_namespace != null ? var.create_namespace : true
  namespace        = var.namespace != null ? var.namespace : "ingress-nginx"
  release_name     = var.release_name != null ? var.release_name : "ingress-nginx"
  settings         = var.settings != null ? var.settings : {}
  timeout          = var.timeout != null ? var.timeout : 120
  values           = var.values != null ? var.values : [file("${path.module}/values.yaml")]
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