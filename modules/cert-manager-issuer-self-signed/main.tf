locals {
  default_namespace = "cert-manager"

  namespace = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
}

resource "kubectl_manifest" "self_signed_cert_cluster_issuer" {
  force_new          = true
  override_namespace = local.namespace
  yaml_body          = file("${path.module}/issuer.yaml")
}