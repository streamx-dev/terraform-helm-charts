output "loadbalancer_ip" {
  description = "K8s cluster Load Balancer IP"
  value       = module.streamx_platform.loadbalancer_ip
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