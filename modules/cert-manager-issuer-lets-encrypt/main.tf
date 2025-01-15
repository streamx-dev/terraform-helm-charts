locals {
  namespace               = var.namespace != null ? var.namespace : "cert-manager"
  name                    = var.name != null ? var.name : "letsencrypt-cert-cluster-issuer"
  prod_letsencrypt_server = var.prod_letsencrypt_server != null ? var.prod_letsencrypt_server : false
  issuer_ingress_class    = var.issuer_ingress_class != null ? var.issuer_ingress_class : "nginx"
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