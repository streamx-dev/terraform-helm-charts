locals {
  default_issuer_ingress_class    = "nginx"
  default_name                    = "letsencrypt-cert-cluster-issuer"
  default_namespace               = "cert-manager"
  default_prod_letsencrypt_server = false

  issuer_ingress_class    = var.force_defaults_for_null_variables && var.issuer_ingress_class == null ? local.default_issuer_ingress_class : var.issuer_ingress_class
  name                    = var.force_defaults_for_null_variables && var.name == null ? local.default_name : var.name
  namespace               = var.force_defaults_for_null_variables && var.namespace == null ? local.default_namespace : var.namespace
  prod_letsencrypt_server = var.force_defaults_for_null_variables && var.prod_letsencrypt_server == null ? local.default_prod_letsencrypt_server : var.prod_letsencrypt_server
}

resource "kubectl_manifest" "letsencrypt_cert_cluster_issuer" {
  force_new          = true
  override_namespace = local.namespace
  yaml_body          = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${local.name}
spec:
  acme:
    server: ${local.prod_letsencrypt_server ? "https://acme-v02.api.letsencrypt.org/directory" : "https://acme-staging-v02.api.letsencrypt.org/directory"}
    email: ${var.issuer_acme_email}
    privateKeySecretRef:
      name: ${local.name}-cluster-issuer-key
    solvers:
      - http01:
          ingress:
            ingressClassName: ${local.issuer_ingress_class}
YAML
}