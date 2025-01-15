locals {
  namespace        = var.namespace != null ? var.namespace : "cert-manager"
}

resource "kubectl_manifest" "self_signed_cert_cluster_issuer" {
  force_new  = true
  override_namespace = local.namespace
  yaml_body = file("${path.module}/issuer.yaml")
}