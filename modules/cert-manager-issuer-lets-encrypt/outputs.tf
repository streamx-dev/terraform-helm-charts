output "cluster_issuer_ingress_annotations" {
  description = "Ingress annotations with cert manager configuration"
  value       = { "cert-manager.io/cluster-issuer" : kubectl_manifest.letsencrypt_cert_cluster_issuer.name }
}