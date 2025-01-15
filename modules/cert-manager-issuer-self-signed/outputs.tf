output "self-signed-cert-cluster-issuer_name" {
  value = kubectl_manifest.self_signed_cert_cluster_issuer.name
}