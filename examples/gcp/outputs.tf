output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = module.streamx_platform.loadbalancer_ip
}

output "cert_manager_lets_encrypt_issuer_ingress_annotations" {
  description = "Ingress annotations with Cert Manager Let's Encrypt issuer configuration"
  value       = module.streamx_platform.cert_manager_lets_encrypt_issuer_ingress_annotations
}

output "kubeconfig_path" {
  description = "K8s cluster kubeconfig file path"
  value       = abspath("${path.module}/env/kubeconfig")
}

output "kubeconfig" {
  description = "K8s cluster kubeconfig"
  value       = file("${path.module}/env/kubeconfig")
  sensitive   = true

  depends_on = [kind_cluster.cluster]
}