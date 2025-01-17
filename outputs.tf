output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = length(module.ingress_controller_nginx) > 0 ? module.ingress_controller_nginx.0.ingress_ip : null
}

output "cert_manager_lets_encrypt_issuer_ingress_annotations" {
  description = "Ingress annotations with Cert Manager Let's Encrypt issuer configuration"
  value       = length(module.cert_manager_lets_encrypt_issuer) > 0 ? module.cert_manager_lets_encrypt_issuer.0.cluster_issuer_ingress_annotations : null
}